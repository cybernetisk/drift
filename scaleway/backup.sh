#!/bin/bash
set -e

# perform full backup and log to slack

../crowd/backup.sh 2>&1 | slacktee.sh >/dev/null
../jira/backup.sh 2>&1 | slacktee.sh >/dev/null
../confluence/backup.sh 2>&1 | slacktee.sh >/dev/null
