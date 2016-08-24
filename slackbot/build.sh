#!/bin/bash

set -e

. ./.vars.sh


if ! [ -d src ]; then
    >&2 echo "Can't find source files, run ./update-source.sh"
    exit 1
fi

docker build -t cyb/slackbot .