#!/bin/bash
set -e

cd "$(dirname "$0")"

# perform full backup
../crowd/backup.sh
../jira/backup.sh
../confluence/backup.sh
../internsystem-backend/backup.sh