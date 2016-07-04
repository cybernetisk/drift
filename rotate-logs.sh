#!/bin/bash
set -e
cd ~/backups/
/snacks/bin/python3 ~cyb/drift/drift/backup/delete_backups.py ~cyb/backups/
