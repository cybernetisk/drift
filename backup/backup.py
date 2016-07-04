#!/usr/bin/env python2
from datetime import datetime
import os

log = open('log.txt', 'a')
mypath = "/home/desiderius/backupscript"

now = datetime.now()

day = now.day
month = now.month
year = now.year

keepDay = [str(date).zfill(2) for date in range(day-7, day+1) if date > 0] + ["29"]

files = []
for (dirpath, dirnames, filenames) in os.walk(mypath):
    files.extend(filenames)
    break

for f in files:
    if "jira" in f or "confluence" in f or "crowd" in f:
        date = f.split("_")[2][-2:]  # Only keep the date part of the filename
        if not any(day in date for day in keepDay):
            log.write(f + '\n')
            os.remove(f)
log.close()
