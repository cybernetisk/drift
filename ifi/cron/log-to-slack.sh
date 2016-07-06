#!/bin/bash

title="$(pwd): $1"

HandleOut() {
    read data
    if [ -n "$data" ]; then
        echo -n "$data" | ~/.local/bin/slacktee.sh -u "$(hostname)" -c drift-stdout -t "$title" >/dev/null
    fi
}

HandleErr() {
    read data
    if [ -n "$data" ]; then
        echo -n "$data" | ~/.local/bin/slacktee.sh -u "$(hostname)" -c drift-stderr -t "$title" >/dev/null
    fi
}

(eval $@ | HandleOut) 2>&1 | HandleErr
