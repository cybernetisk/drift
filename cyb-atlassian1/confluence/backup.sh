#!/bin/bash

# som root

data_dir=/var/lib/docker/volumes/confluence-data/_data
cur_dir=$(pwd)
sqlfile=confluence_db_$(date +%Y%m%d_%H%M).sql
backupfile=confluence_backup_$(date +%Y%m%d_%H%M).tgz

# eksporter database
docker exec -it -u postgres cyb-postgres pg_dump confluencedb >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
(cd "$data_dir"
 echo $(pwd)
 tar zcvf $cur_dir/$backupfile $cur_dir/$sqlfile attachments/ confluence.cfg.xml index/)

# last opp backup til cyb-brukeren på UiO
#scp $backupfile cyb@login.ifi.uio.no:backups/

# slett lokal backup
#rm $backupfile $sqlfile
