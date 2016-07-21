#!/bin/bash

# This script will set up a temporary container and optionally run
# the provided command, or else start a shell. The container will
# be removed after use.

command=sh
if [ -n "$1" ]; then
    command="$@"
fi

. load-vars.sh

docker run \
  -it \
  --rm \
  --net cyb \
  -e "DJANGO_SECRET_KEY=$SECRETKEY" \
  -e 'DJANGO_ENABLE_SAML=1' \
  -e 'DJANGO_DEBUG=1' \
  -e "POSTGRES_PASSWORD=$PGPASS" \
  -v "$(pwd)/settings_local.py":/usr/src/app/cyb_oko/settings_local.py \
  -v "$(pwd)/samlauth_settings.json":/usr/src/app/samlauth/prod/settings.json \
  -v internsystem-backend-static:/usr/src/static \
  cyb/internsystem-backend \
  $command
