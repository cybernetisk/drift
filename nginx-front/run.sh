#!/bin/bash

docker run \
    -d \
    --net cyb \
    --restart always \
    --name cyb-nginx-front \
    -v internsystem-frontend-build:/var/www/internsystem-frontend-build \
    -v internsystem-static:/var/www/internsystem-static \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -v okoreports-reports:/var/www/okoreports-reports \
    -v okoreports-frontend-dist:/var/www/okoreports-frontend-dist \
    -p 80:80 -p 443:443 \
    cyb/nginx-front
