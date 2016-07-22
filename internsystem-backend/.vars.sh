#!/bin/bash

if [ -z "$ENV" ]; then
    >&2 echo "You must specify the environment that is to be used, e.g.:"
    >&2 echo "\$ ENV=test ./build.sh"
    exit 1
fi

if ! [ -d "environments/$ENV" ]; then
    >&2 echo "Environment $ENV not found"
    exit 1
fi

echo "Environment: $ENV"

env_subdir=environments/$ENV

. $env_subdir/vars.sh

keyfile=$env_subdir/secretkey.txt
if ! [ -f "$keyfile" ]; then
    printf "Enter secret key to use in application: "
    read -s secretkey
    echo
    echo "Saving to $keyfile for later use"
    echo "$secretkey" >$keyfile
fi

pgpassfile=$env_subdir/pgpass.txt
if ! [ -f "$pgpassfile" ]; then
    printf "Enter password to postgres: "
    read -s pgpass
    echo
    echo "Saving to $pgpassfile for later use"
    echo "$pgpass" >$pgpassfile
fi

env_secretkey=$(<$keyfile)
env_pgpass=$(<$pgpassfile)
