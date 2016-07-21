#!/bin/bash

interactive=$([ -t 0 ] && echo '-it' || echo '')

docker run \
  $interactive \
  --rm \
  -v $volume_dist:/usr/src/app-build \
  cyb/internsystem-frontend:$image_tag \
  bash
