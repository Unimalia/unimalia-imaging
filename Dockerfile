FROM ohif/app:v3.9.2 AS ohif

FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    nginx \
 && wget -qO - https://orthanc.uclouvain.be/debian/archive.key | gpg --dearmor -o /usr/share/keyrings/orthanc.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/orthanc.gpg] https://orthanc.uclouvain.be/debian/ bookworm main" > /etc/apt/sources.list.d/orthanc.list \
 && apt-get update \
 && apt-get install -y \
    orthanc \
    orthanc-dicomweb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY orthanc.json /etc/orthanc/orthanc.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY app-config.js /usr/share/nginx/html/app-config.js

COPY --from=ohif /usr/share/nginx/html/ /usr/share/nginx/html/

RUN mkdir -p /var/lib/orthanc/db /run/nginx

CMD sh -c "Orthanc /etc/orthanc/orthanc.json & nginx -g 'daemon off;'"