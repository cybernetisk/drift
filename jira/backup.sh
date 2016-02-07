#!/bin/bash

# som root

cd /var/atlassian/application-data/jira

sqlfile=jira_db_$(date +%Y%m%d_%H%M).sql
backupfile=jira_backup_$(date +%Y%m%d_%H%M).tgz

# eksporter database
su postgres -c "pg_dump jiradb" >$sqlfile

# legg database, konfigurasjon og opplastede vedlegg i en pakke
tar zcvf $backupfile $sqlfile data/ caches/indexes/ dbconfig.xml /opt/atlassian/jira/conf/server.xml

# last opp backup til cyb-brukeren på UiO
scp $backupfile cyb@login.ifi.uio.no:backups/

# slett lokal backup
rm $backupfile $sqlfile
