#!/bin/bash
set -e

# som root

echo "Taking backup of crowd..."

sqlfile=crowd_db_$(date -u +%Y%m%d_%H%M)Z.sql
backupfile=crowd_backup_$(date -u +%Y%m%d_%H%M)Z.tgz
dest=cyb@login.ifi.uio.no:backups/$backupfile
backupfile=/tmp/$backupfile

cd /var/lib/docker/volumes/crowd-data/_data/

# eksporter database
docker exec -itu postgres cyb-postgres pg_dump crowd >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
tar zcf $backupfile $sqlfile client.crowd.properties crowd.cfg.xml crowd.properties
rm $sqlfile

# last opp backup til cyb-brukeren på UiO
scp -o StrictHostKeyChecking=no $backupfile $dest

echo "Completed backup of crowd to $dest"
ls -lh $backupfile

# slett lokal backup
rm $backupfile
