#!/bin/bash

echo "See https://cybernetisk.slack.com/services/B1ESX29MH for the webhook URL"
echo "No need to use upload token. Set channel to drift-info and username to the hostname if possible"

cd
git clone https://github.com/course-hero/slacktee.git
./slacktee/install.sh ~/.local/bin
