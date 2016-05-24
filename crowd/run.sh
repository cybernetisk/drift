#!/bin/bash

#  --link cyb-postgres \
#  -d --restart=always \
docker run \
  -it --name crowd \
  -v crowd-data:/var/atlassian/crowd \
  -p 0.0.0.0:8095:8095 \
  cyb/crowd
