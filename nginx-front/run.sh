#!/bin/bash

docker run \
    -d \
    --restart always \
    --name cyb-nginx-front \
    -v nginx-certs:/opt/letsencrypt.sh/certs \
    -p 80:80 -p 443:443 \
    --link cyb-confluence:cyb-confluence \
    --link cyb-crowd:cyb-crowd \
    --link cyb-jira:cyb-jira \
    cyb/nginx-front
