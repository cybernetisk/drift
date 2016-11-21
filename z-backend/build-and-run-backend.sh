#!/bin/bash

cd src

docker build -t cyb/z-backend .
docker rm -f cyb-z-backend 2>/dev/null || true
./run.sh
