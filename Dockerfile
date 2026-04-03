FROM node:18-alpine

# Install nginx + tools
RUN apk add --no-cache nginx curl bash

# -----------------------
# ORTHANC
# -----------------------
RUN mkdir -p /orthanc
COPY orthanc.json /orthanc/orthanc.json

# Install Orthanc
RUN apk add --no-cache orthanc

# -----------------------
# OHIF BUILD
# -----------------------
RUN mkdir /ohif
WORKDIR /ohif

RUN git clone https://github.com/OHIF/Viewers.git .

RUN yarn install
RUN yarn build

# -----------------------
# NGINX CONFIG
# -----------------------
RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/nginx.conf

# OHIF static
RUN cp -r /ohif/platform/app/dist/* /usr/share/nginx/html/

# Custom config
COPY app-config.js /usr/share/nginx/html/app-config.js

# -----------------------
# START SCRIPT
# -----------------------
CMD sh -c "\
orthanc /orthanc/orthanc.json & \
nginx -g 'daemon off;' \
"