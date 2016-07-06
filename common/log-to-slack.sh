#!/bin/bash

title="$(pwd): $1"

slacktee=/usr/bin/slacktee.sh
if [ $(id -un) == "cyb" ]; then
    slacktee=~/.local/bin/slacktee.sh
fi

HandleOut() {
    read data
    if [ -n "$data" ]; then
        echo -n "$data" | $slacktee -u "$(hostname)" -c drift-stdout -t "$title" >/dev/null
    fi
}

HandleErr() {
    read data
    if [ -n "$data" ]; then
        echo -n "$data" | $slacktee -u "$(hostname)" -c drift-stderr -t "$title" >/dev/null
    fi
}

(eval $@ | HandleOut) 2>&1 | HandleErr
