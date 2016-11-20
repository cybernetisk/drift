#!/bin/bash

if ! [ -d src ]; then
    git clone git@github.com:cybrairai/z-backend.git src
else
    (cd src && git pull)
fi
