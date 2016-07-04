#!/usr/bin/env python3
from datetime import datetime
import os
import sys

log = open('deletelog.txt', 'a')

if len(sys.argv) == 1:
    print("Usage: python3 backup.py /path/here")
    sys.exit()

mypath = str(sys.argv[1])

if not os.path.isdir(mypath):
    print("%s is not a valid dir" % mypath)
    sys.exit()

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
            log.write(mypath + f + '\n')
            os.remove(mypath + f)
log.close()
