#!/bin/bash

docker run \
    -d \
    --net cyb \
    --restart always \
    --name cyb-nginx-front \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -v okoreports-reports:/var/www/okoreports-reports \
    -v okoreports-frontend-dist:/var/www/okoreports-frontend-dist \
    -p 80:80 -p 443:443 \
    cyb/nginx-front
