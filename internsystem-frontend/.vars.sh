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
