#!/bin/bash

docker run \
    -d \
    --net cyb \
    --restart always \
    --name cyb-nginx-front \
    -e LE_CONTACT_EMAIL=drift@cyb.no \
    -v internsystem-backend-static:/var/www/internsystem-backend-static \
    -v internsystem-backend-static-test:/var/www/internsystem-backend-static-test \
    -v internsystem-frontend-dist:/var/www/internsystem-frontend-dist \
    -v internsystem-frontend-dist-test:/var/www/internsystem-frontend-dist-test \
    -v internsystem-frontend-dist-test-frontend:/var/www/internsystem-frontend-dist-test-frontend \
    -v letsencrypt-certs:/opt/letsencrypt.sh/certs \
    -v letsencrypt-accounts:/opt/letsencrypt.sh/accounts \
    -v okoreports-reports:/var/www/okoreports-reports \
    -v okoreports-frontend-dist:/var/www/okoreports-frontend-dist \
    -v /root/cyb50:/tmp/cyb50 \
    -v "$(pwd)/nginx/nginx.conf":/etc/nginx/nginx.conf \
    -v "$(pwd)/nginx/okoreports.htpasswd":/etc/nginx/okoreports.htpasswd \
    -v "$(pwd)/nginx/conf.d":/etc/nginx/conf.d \
    -p 80:80 -p 443:443 \
    henrist/nginx-letsencrypt
