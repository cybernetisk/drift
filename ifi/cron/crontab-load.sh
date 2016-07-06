#!/bin/bash

if [ $(id -nu) != cyb ] || [ $(hostname) != vor.ifi.uio.no ]; then
    "Must be user 'cyb' running on 'vor.ifi.uio.no' to use this script"
    exit 1
fi

crontab crontab
