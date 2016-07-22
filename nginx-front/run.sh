#!/bin/bash

docker run \
    -d \
    --net cyb \
    --restart always \
    --name cyb-nginx-front \
    -v internsystem-backend-static:/var/www/internsystem-backend-static \
    -v internsystem-backend-static-test:/var/www/internsystem-backend-static-test \
    -v internsystem-frontend-dist:/var/www/internsystem-frontend-dist \
    -v internsystem-frontend-dist-test:/var/www/internsystem-frontend-dist-test \
    -v internsystem-frontend-dist-test-frontend:/var/www/internsystem-frontend-dist-test-frontend \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -v okoreports-reports:/var/www/okoreports-reports \
    -v okoreports-frontend-dist:/var/www/okoreports-frontend-dist \
    -p 80:80 -p 443:443 \
    cyb/nginx-front
