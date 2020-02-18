#!/bin/bash
echo -n "Enter your FEIDE e-mail address (USER@uio.no): "
read -r OS_USERNAME
echo -n "Enter your NREC API password: "
read -r -s OS_PASSWORD

export OS_USERNAME
export OS_PASSWORD
export OS_PROJECT_NAME=uio-stud-ii-cs
export OS_AUTH_URL=https://api.nrec.no:5000/v3
export OS_IDENTITY_API_VERSION=3
export OS_USER_DOMAIN_NAME=dataporten
export OS_PROJECT_DOMAIN_NAME=dataporten
export OS_REGION_NAME=osl
export OS_NO_CACHE=1
