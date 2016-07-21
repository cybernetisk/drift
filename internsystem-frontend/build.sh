#!/bin/bash

set -e

. .vars.sh

if ! [ -d src ]; then
    >&2 echo "No source files exists, please run ./update-source.sh"
    exit 1
fi

commit=$(cd src && git rev-parse --short HEAD)
docker build -t cyb/internsystem-frontend:$commit -t cyb/internsystem-frontend:$env_image_tag .
