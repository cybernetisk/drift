#!/bin/bash

docker run \
  --name cyb-crowd \
  --net cyb \
  -d --restart=always \
  -v crowd-data:/var/atlassian/crowd \
  cyb/crowd
