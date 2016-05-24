#!/bin/bash

docker run --name cyb-postgres \
    --restart=always \
    -v pgdata:/var/lib/postgresql/data \
    -d -p 127.0.0.1:5432:5432 \
    postgres

