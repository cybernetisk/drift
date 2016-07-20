#!/bin/bash

docker run \
    -d \
    --net cyb \
    --restart always \
    --name cyb-nginx-front \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -v internsystem-static:/var/www/internsystem-static \
    -v internsystem-frontend-build:/var/www/internsystem-frontend-build \
    -p 80:80 -p 443:443 \
    cyb/nginx-front
