#!/bin/bash

docker run \
  --name cyb-crowd \
  -d --restart=always \
  -v crowd-data:/var/atlassian/crowd \
  --link cyb-postgres \
  cyb/crowd
