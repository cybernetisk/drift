#!/bin/bash

dropbox() {
    docker exec cyb-dropbox bash -c "LANG=C.UTF-8 dropbox $*"
}

echo "This script must probably be run multiple times manually with commented out sections to get the correct folder to be included"

dropbox exclude "*"
dropbox exclude remove "Økonomigruppa"
dropbox exclude add "Økonomigruppa/*"
dropbox exclude remove "Økonomigruppa/2\\ Kassesystemet"
