#!/bin/bash

set -e

echo "Backing up internsystem"

now=$(date -u +%Y%m%d_%H%M%S)Z
sqlfile=internsystem_db_$now.sql
backupfile=internsystem_backup_$(hostname -s)_$now.tgz
dest=cyb@login.ifi.uio.no:backups/$backupfile
backupfile=/tmp/$backupfile

docker exec -iu postgres cyb-postgres pg_dump internsystem >$sqlfile

tar zcf $backupfile $sqlfile
rm $sqlfile

scp -o StrictHostKeyChecking=no $backupfile $dest

echo "Completed backup of internsystem to $dest"
ls -lh $backupfile

rm $backupfile
