#!/bin/bash

title="$(pwd): $1"

slacktee=/usr/bin/slacktee.sh
if [ $(id -un) == "cyb" ]; then
    slacktee=~/.local/bin/slacktee.sh
fi

HandleData() {
    channel=$1

    IFS='' read -r line
    if [ -n "$line" ]; then
        (
            echo "$line"
            while IFS='' read -r line; do
                echo "$line"
            done
        ) | $slacktee -u "$(hostname)" -c "$channel" -t "$title" >/dev/null
    fi
}

(eval $@ | HandleData drift-stdout) 2>&1 | HandleData drift-stderr
