#!/bin/bash
set -eu

if [ -z "${1:-}" ]; then
  echo "Missing tagname of released Docker image"
  exit 1
fi

dockerrepo=cybernetisk/in-backend
dockertag="$1"

. .vars.sh

if [ -z "${SKIP_BACKUP:-}" ]; then
  ./backup.sh
fi

running=$(docker inspect --format="{{ .State.Running }}" $env_container_name 2>/dev/null || true)
if [ "$running" != "" ]; then
  if [ "$running" == "true" ]; then
    docker stop $env_container_name
  fi
  docker rm $env_container_name
fi

export DOCKERIMAGE=$dockerrepo:$dockertag

docker pull $DOCKERIMAGE

./shell.sh ./manage.py migrate --noinput
./shell.sh ./manage.py collectstatic --noinput

./run.sh
