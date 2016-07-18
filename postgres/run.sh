#!/bin/bash

docker run \
    --name cyb-postgres \
    --net cyb \
    -d --restart=always \
    -v pgdata:/var/lib/postgresql/data \
    postgres
