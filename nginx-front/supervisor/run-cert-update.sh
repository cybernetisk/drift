#!/bin/bash
set -e

echo "Starting cert update timer"

# prerequisite:
# 1. /etc/ssl/certs/dhparam.pem must be generated
# 2. nginx must be running and serving the well known directory

# this script normally starts while dhparams is generated, so let it complete
sleep 120

cd /opt/letsencrypt.sh

while true; do
    date
    echo "Updating certificates"

    ./letsencrypt.sh -c -f config
    echo "Reloading nginx"
    kill -HUP $(cat /var/run/nginx.pid)

    sleep 1d
done
