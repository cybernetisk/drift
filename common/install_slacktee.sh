#!/bin/bash

echo "See https://cybernetisk.slack.com/services/B1ESX29MH for the webhook URL"
echo "No need to use upload token. Set channel to drift-stdout and username to the hostname if possible"

cd
git clone https://github.com/course-hero/slacktee.git

if [ $(id -un) == root ]; then
    ./slacktee/install.sh
    ln -s /usr/local/bin/slacktee.sh /usr/bin/slacktee.sh
else
    # for ifi setup
    mkdir -p ~/.local/bin
    ./slacktee/install.sh ~/.local/bin
fi
