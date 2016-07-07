#!/bin/bash

title="$(pwd): $1"

slacktee=/usr/bin/slacktee.sh
if [ $(id -un) == "cyb" ]; then
    slacktee=~/.local/bin/slacktee.sh
fi

(eval $@ | $slacktee -u "$(hostname)" -c drift-stdout -t "$title" >/dev/null) 2>&1 | $slacktee -u "$(hostname)" -c drift-stderr -t "$title" >/dev/null
