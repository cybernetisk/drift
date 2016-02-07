#!/bin/bash

# som root

cd /var/atlassian/application-data/confluence

sqlfile=confluence_db_$(date +%Y%m%d_%H%M).sql
backupfile=confluence_backup_$(date +%Y%m%d_%H%M).tgz

# eksporter database
su postgres -c "pg_dump confluencedb" >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
tar zcvf $backupfile $sqlfile attachments/ confluence.cfg.xml index/ /opt/atlassian/confluence/conf/server.xml

# last opp backup til cyb-brukeren på UiO
scp $backupfile cyb@login.ifi.uio.no:backups/

# slett lokal backup
rm $backupfile $sqlfile
