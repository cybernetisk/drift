#!/bin/bash

docker run \
  --name cyb-confluence \
  -d --restart=always \
  -v confluence-data:/var/atlassian/confluence \
  -p 127.0.0.1:8090:8090 \
  --link cyb-postgres \
  cyb/confluence
