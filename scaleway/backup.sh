#!/bin/bash
set -e

cd "$(dirname "$0")"

# perform full backup
../crowd/backup.sh
../jira/backup.sh
../confluence/backup.sh

# changing dir for internsystem
cd ../internsystem-backend
ENV=prod ./backup.sh
