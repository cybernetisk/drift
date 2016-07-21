#!/bin/bash

docker run \
  -it \
  --rm \
  -v $volume_dist:/usr/src/app-build \
  cyb/internsystem-frontend:$image_tag \
  bash
