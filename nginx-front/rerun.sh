#!/bin/bash

docker stop cyb-nginx-front
docker rm -f cyb-nginx-front
./run.sh
