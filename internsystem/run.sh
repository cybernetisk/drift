#!/bin/bash

# TODO: change SECRET_KEY and persist it outside git-repo
#       (the current value is just some random for stagetesting)
docker run \
  --name cyb-internsystem \
  --net cyb \
  -d --restart=always \
  -e 'DJANGO_SECRET_KEY=MDY5NTgxODZlZTFmYTE0NmNkNmJhYjg4' \
  -e 'DJANGO_DEBUG=1' \
  cyb/internsystem
