#!/bin/bash

set -e

. .vars.sh

if ! [ -d src ]; then
    echo "No source files exists, please run ./update-source.sh"
    exit 1
fi

current_branch=$(cd src && git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
if [ "$current_branch" != "$env_branch" ]; then
    >&2 echo "ERROR: Branch $current_branch is checked out, expected $env_branch"
    exit 1
fi

commit=$(cd src && git rev-parse --short HEAD)
docker build -t cyb/internsystem-backend:$commit -t cyb/internsystem-backend:$env_image_tag .
