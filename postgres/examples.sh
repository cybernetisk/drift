#!/bin/bash

echo "this file should not be executed"
exit 1

## postgres commands

# gain access to interactive mode to database "nameofdb"
docker exec -itu postgres cyb-postgres psql nameofdb

## client applications

# gain access to shell to use client applications
docker exec -itu postgres cyb-postgres bash

# in shell, create new user "nameofuser"
createuser -P -E nameofuser

# in shell, create database "nameofdb" and set owner to "nameofuser"
createdb --owner nameofuser --encoding utf8 nameofdb

# in shell, delete database "nameofdb"
dropdb nameofdb

# in shell, delete user "nameofuser"
dropuser nameofuser

# dump backup of database "nameofdb" to stdout
docker exec -itu postgres cyb-postgres pg_dump nameofdb

# import backup to database "nameofdb" from file "mybackup.sql"
docker exec -iu postgres cyb-postgres psql nameofdb <mybackup.sql

# client applications reference:
# https://www.postgresql.org/docs/9.1/static/reference-client.html
