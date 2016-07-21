#!/bin/bash

. .vars.sh

docker run \
  --rm \
  -v $env_volume_dist:/usr/src/app-build \
  -e NODE_ENV=production \
  -e BACKEND_URL="$env_backend_url" \
  cyb/internsystem-frontend:$env_image_tag
