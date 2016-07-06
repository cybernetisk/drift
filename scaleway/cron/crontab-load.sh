#!/bin/bash

if [ $(id -nu) != root ] || [ $(hostname) !=  scw-78960e ]; then
    "Must be user 'root' running on 'scw-78960e' to use this script"
    exit 1
fi

crontab crontab
