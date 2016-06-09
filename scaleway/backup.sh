#!/bin/bash
set -e

cd "$(dirname "$0")"

# perform full backup and log to slack

../crowd/backup.sh 2>&1 | slacktee.sh >/dev/null
../jira/backup.sh 2>&1 | slacktee.sh >/dev/null
../confluence/backup.sh 2>&1 | slacktee.sh >/dev/null
