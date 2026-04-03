FROM ohif/app:v3.9.2

ENV PORT=10000

# Install Orthanc + plugin
RUN apt-get update && apt-get install -y \
    orthanc \
    orthanc-dicomweb \
    nginx \
 && apt-get clean

# Copia config Orthanc
COPY orthanc.json /etc/orthanc/orthanc.json

# 🔴 SOVRASCRIVE CONFIG OHIF
COPY app-config.js /usr/share/nginx/html/app-config.js

# 🔴 FORZA OHIF A USARE LA CONFIG GIUSTA
RUN sed -i 's|config/default.js|app-config.js|g' /usr/share/nginx/html/index.html

RUN mkdir -p /var/lib/orthanc/db

EXPOSE 10000

CMD sh -c "Orthanc /etc/orthanc/orthanc.json & nginx -g 'daemon off;'"