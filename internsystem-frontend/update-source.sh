#!/bin/bash

. .vars.sh

if ! [ -d src ]; then
    git clone git@github.com:cybernetisk/internsystem-frontend.git src
    cd src
    git checkout $env_branch
else
    (cd src && git checkout $env_branch && git pull)
fi
