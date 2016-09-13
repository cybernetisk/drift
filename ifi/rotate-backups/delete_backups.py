#!/usr/bin/env python3
import datetime
import os
import sys

def keepDays(now, numberOfDays):
    days = list()
    for i in range(0, numberOfDays):
        days.append(str((now -datetime.timedelta(days=i)).day).zfill(2))
    return days

log = open('deletelog.txt', 'a')

if len(sys.argv) == 1:
    print("Usage: python3 backup.py /path/here")
    sys.exit()

mypath = str(sys.argv[1])

if not os.path.isdir(mypath):
    print("%s is not a valid dir" % mypath)
    sys.exit()

now = datetime.datetime.now()


# Getting days to keep
keepDay = keepDays(now, 7)

#Appending the first
keepDay.append('01')


files = []
for (dirpath, dirnames, filenames) in os.walk(mypath):
    files.extend(filenames)
    break

print('Deleting files...\n')
for f in files:
    if "jira" in f or "confluence" in f or "crowd" in f or "internsystem" in f:
        date = f.split("_")[2][-2:]  # Only keep the date part of the filename
        if not any(day in date for day in keepDay):
            log.write(mypath + f + '\n')
            print(mypath + f + '\n')
            os.remove(mypath + f)
log.close()
