#!/bin/bash

docker run \
  -it \
  --rm \
  -v internsystem-frontend-build:/usr/src/app-build \
  cyb/internsystem-frontend \
  bash
