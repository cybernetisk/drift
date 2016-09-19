#!/bin/bash

docker run \
  --name cyb-crowd \
  --net cyb \
  -d --restart=always \
  -v crowd-data:/var/atlassian/crowd \
  cyb/crowd

docker inspect -f 'created:{{.Created}}   {{.Image}}' cyb-crowd >>run.log
