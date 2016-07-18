#!/bin/bash

docker run \
  -it \
  --rm \
  -e 'DJANGO_SECRET_KEY=i-dont-care' \
  -v internsystem-static:/usr/src/static \
  cyb/internsystem \
  ./manage.py collectstatic --noinput

#  -v "$(pwd)/build-static":/usr/src/static \
