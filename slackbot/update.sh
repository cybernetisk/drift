#!/bin/bash

# This scripts updates the code to latest from Git
# rebuild the Docker image and reruns the container

# It is meant to be called when new code is pushed
# to master

set -e

. .vars.sh

./update-source.sh
./build.sh

running=$(docker inspect --format="{{ .State.Running }}" $env_container_name 2>/dev/null || true)
if [ "$running" != "" ]; then
    if [ "$running" == "true" ]; then
        docker stop $env_container_name
    fi
    docker rm $env_container_name
fi

./run.sh