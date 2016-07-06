#!/bin/bash

running=$(~/dropbox.py running)

if [[ $? == 1 ]]; then
    exit 0
fi

umask 0002

echo "Starting Dropbox because it is not running"
~/dropbox.py start

pid=$(pgrep -u cyb ^dropbox$)
if [[ $? == 0 ]]; then
    pid=$(echo "$pid" | head -1)
    renice 11 "$pid"
fi

