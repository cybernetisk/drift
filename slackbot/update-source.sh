#!/bin/bash

if ! [ -d src ]; then
    git clone git@github.com:cybernetisk/slackbot.git src
else
    (cd src && git pull)
fi
