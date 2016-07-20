#!/bin/bash

docker run \
  --rm \
  -v internsystem-frontend-build:/usr/src/app-build \
  -e NODE_ENV=production \
  -e BACKEND_URL="https://in.cyb.no/" \
  cyb/internsystem-frontend
