#!/bin/bash
set -e

if [[ ! -f "/etc/ssl/certs/dhparam.pem" ]]; then
    echo "dhparam not existing - generating ..."
    openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048
fi

if [[ ! -f "/opt/letsencrypt.sh/certs/confluence.staging.cyb.no/fullchain.pem" ]]; then
    echo "missing certificates, will try to generate them"
fi

# spawn a temporary nginx session that only serves http for certs authorization
nginx -c /etc/nginx/nginx-certs-generation.conf

cd /opt/letsencrypt.sh
./letsencrypt.sh -c -f config

kill $(cat /var/run/nginx.pid)
sleep 2

echo "Starting nginx in non-daemon mode"
nginx -g "daemon off;"
