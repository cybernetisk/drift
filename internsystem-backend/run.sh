#!/bin/bash
set -eu

. .vars.sh

running=$(docker inspect --format="{{ .State.Running }}" $env_container_name 2>/dev/null || true)
if [ "$running" != "" ]; then
    printf "The container already exists. Do you want to remove it? (y/n) "
    read remove

    if [ "$remove" != "y" ]; then
        echo "Aborting"
        exit 1
    fi

    if [ "$running" == "true" ]; then
        docker stop $env_container_name
    fi

    docker rm $env_container_name
fi

docker run \
  --name $env_container_name \
  --net cyb \
  -d --restart=unless-stopped \
  -e "DJANGO_SECRET_KEY=$env_secretkey" \
  -e "DJANGO_DEBUG=$env_django_debug" \
  -e "POSTGRES_NAME=$env_pgname" \
  -e "POSTGRES_PASSWORD=$env_pgpass" \
  -v "$(pwd)/$env_subdir/settings_local.py":/app/cyb_oko/settings_local.py \
  -v "$(pwd)/$env_subdir/samlauth_settings.json":/app/samlauth/prod/settings.json \
  $DOCKERIMAGE
