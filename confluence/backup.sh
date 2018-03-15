#!/bin/bash
set -e

# som root

echo "Taking backup of confluence..."

sqlfile=confluence_db_$(date -u +%Y%m%d_%H%M)Z.sql
backupfile=confluence_backup_$(date -u +%Y%m%d_%H%M)Z.tgz
dest=cyb@login.ifi.uio.no:backups/$backupfile
backupfile=/tmp/$backupfile

cd /var/lib/docker/volumes/confluence-data/_data/

# eksporter database
docker exec -iu postgres cyb-postgres pg_dump confluence >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
tar zcf $backupfile \
	$sqlfile \
	attachments/ \
	confluence.cfg.xml \
	index/ \
	originaltheme/categories/icons/

rm $sqlfile

# last opp backup til cyb-brukeren på UiO
scp -o StrictHostKeyChecking=no $backupfile $dest

echo "Completed backup of confluence to $dest"
ls -lh $backupfile

# slett lokal backup
rm $backupfile
