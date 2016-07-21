#!/bin/bash

keyfile=secret-key.txt
if ! [ -f "$keyfile" ]; then
    printf "Enter secret key to use in application: "
    read -s SECRETKEY
    echo
    echo "Saving to $keyfile for later use"
    echo "$SECRETKEY" >$keyfile
fi

pgpassfile=pgpass.txt
if ! [ -f "$pgpassfile" ]; then
    printf "Enter password to postgres: "
    read -s PGPASS
    echo
    echo "Saving to $pgpassfile for later use"
    echo "$PGPASS" >$pgpassfile
fi

SECRETKEY=$(<$keyfile)
PGPASS=$(<$pgpassfile)
