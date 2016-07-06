#!/bin/bash
set -e
cd ~/backups/
/snacks/bin/python3 ~cyb/drift/ifi/rotate-backups/delete_backups.py ~cyb/backups/
