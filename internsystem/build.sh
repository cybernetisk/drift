#!/bin/bash

set -e

if ! [ -d src ]; then
    git clone git@github.com:cybrairai/internsystem.git src
else
    (cd src && git pull)
fi

docker build -t cyb/internsystem .
