#!/bin/bash

docker run \
    --name cyb-nginx-front \
    -d \
    --restart always \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -p 80:80 -p 443:443 \
    cyb/nginx-front

