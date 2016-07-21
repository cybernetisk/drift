#!/bin/bash

# This script will set up a temporary container and optionally run
# the provided command, or else start a shell. The container will
# be removed after use.

command=sh
if [ -n "$1" ]; then
    command="$@"
fi

. .vars.sh

interactive=$([ -t 0 ] && echo '-it' || echo '')

docker run \
  $interactive \
  --rm \
  --net cyb \
  -e "DJANGO_SECRET_KEY=$env_secretkey" \
  -e 'DJANGO_ENABLE_SAML=1' \
  -e 'DJANGO_DEBUG=1' \
  -e "POSTGRES_NAME=$env_pgname" \
  -e "POSTGRES_PASSWORD=$env_pgpass" \
  -v "$(pwd)/$env_subdir/settings_local.py":/usr/src/app/cyb_oko/settings_local.py \
  -v "$(pwd)/$env_subdir/samlauth_settings.json":/usr/src/app/samlauth/prod/settings.json \
  -v $env_volume_static:/usr/src/static \
  cyb/internsystem-backend:$env_image_tag \
  $command
