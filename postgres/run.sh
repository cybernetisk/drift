#!/bin/bash

docker run \
    --name cyb-postgres \
    -d --restart=always \
    -v pgdata:/var/lib/postgresql/data \
    postgres
