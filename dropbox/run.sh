#!/bin/bash

docker run \
    -d --restart=always \
    --name=cyb-dropbox \
    -e DBOX_UID=1000 \
    -e DBOX_GID=1000 \
    -v dropbox-synced:/dbox/Dropbox \
    -v dropbox-data:/dbox/.dropbox \
    janeczku/dropbox
