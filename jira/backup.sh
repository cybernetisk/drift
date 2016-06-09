#!/bin/bash
set -e

# som root

echo "Taking backup of jira..."

sqlfile=jira_db_$(date -u +%Y%m%d_%H%M)Z.sql
backupfile=jira_backup_$(date -u +%Y%m%d_%H%M)Z.tgz
dest=cyb@login.ifi.uio.no:backups/$backupfile
backupfile=/tmp/$backupfile

cd /var/lib/docker/volumes/jira-data/_data/

# eksporter database
docker exec -iu postgres cyb-postgres pg_dump jira >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
tar zcf $backupfile $sqlfile data/ caches/indexes/ dbconfig.xml
rm $sqlfile

# last opp backup til cyb-brukeren på UiO
scp -o StrictHostKeyChecking=no $backupfile $dest

echo "Completed backup of jira to $dest"
ls -lh $backupfile

# slett lokal backup
rm $backupfile
