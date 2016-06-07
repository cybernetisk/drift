#!/bin/bash

if [ ! -f crowd-pass.txt ]; then
    printf "Enter password for Crowd service: "
    read -s CROWDPASS
    echo
    echo "Saving to crowd-pass.txt for later use"
    echo "$CROWDPASS" >crowd-pass.txt
fi

CROWDPASS=$(<crowd-pass.txt)

docker run \
  --name cyb-confluence \
  -d --restart=always \
  -v confluence-data:/var/atlassian/confluence \
  --link cyb-postgres \
  -e "X_PROXY_NAME=confluence.cyb.no" \
  -e "X_PROXY_PORT=443" \
  -e "X_PROXY_SCHEME=https" \
  -e "X_CROWD_PASSWORD=$CROWDPASS" \
  cyb/confluence
