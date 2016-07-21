#!/bin/bash

set -e

. load-vars.sh

running=$(docker inspect --format="{{ .State.Running }}" cyb-internsystem 2>/dev/null || true)
if [ "$running" != "" ]; then
    printf "The container already exists. Do you want to remove it? (y/n) "
    read remove

    if [ "$remove" != "y" ]; then
        echo "Aborting"
        exit 1
    fi

    if [ "$running" == "true" ]; then
        docker stop cyb-internsystem
    fi

    docker rm cyb-internsystem
fi

docker run \
  --name cyb-internsystem \
  --net cyb \
  -d --restart=always \
  -e "DJANGO_SECRET_KEY=$SECRETKEY" \
  -e 'DJANGO_ENABLE_SAML=1' \
  -e 'DJANGO_DEBUG=1' \
  -e "POSTGRES_PASSWORD=$PGPASS" \
  -v "$(pwd)/settings_local.py":/usr/src/app/cyb_oko/settings_local.py \
  -v "$(pwd)/samlauth_settings.json":/usr/src/app/samlauth/prod/settings.json \
  cyb/internsystem
