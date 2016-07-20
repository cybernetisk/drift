#!/bin/bash

# This scripts updates the code to latest from Git
# rebuild the Docker image and reruns the container

# It is meant to be called when new code is pushed
# to master

set -e

./update-source.sh
./build.sh

if [ "$1" != "init" ]; then
    ./backup.sh
fi

running=$(docker inspect --format="{{ .State.Running }}" cyb-internsystem 2>/dev/null)
if [ $? -eq 0 ]; then
    if [ "$running" == "true" ]; then
        docker stop cyb-internsystem
    fi
    docker rm cyb-internsystem
fi

./shell.sh ./manage.py migrate
./shell.sh ./manage.py collectstatic --noinput

./run.sh
