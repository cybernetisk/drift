#!/bin/bash

# this scripts allows for easier access to the scaleway server
# it requires you already can access cyb-user at UiO

if [ $(id -un) != cyb ]; then
    ssh -t cyb@login.ifi.uio.no ssh root@163.172.140.45
else
    ssh root@163.172.140.45
fi
