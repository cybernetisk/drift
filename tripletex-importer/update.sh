#!/bin/bash

./update-source.sh

cd src/tripletex-importer

./build.sh

if ! [ -f reports.json ]; then
    ln -s ~/drift/z-backend/src/reports.json reports.json
fi

if ! [ -f settings.py ]; then
    echo "contextId = 2845076" >settings.py
fi
