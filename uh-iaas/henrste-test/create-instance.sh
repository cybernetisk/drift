#!/bin/bash
set -e

image=48091c58-7b22-4736-88d3-2560b13c77ee
name=henrste-20180117-coreos-1

date >>openstack.log

nova boot \
  --user-data ./config.ign \
  --image $image \
  --key-name cyb-at-uio \
  --flavor m1.large \
  --nic net-name=dualStack \
  --security-groups henrste-ssh,henrste-icmp \
  $name \
  | tee -a openstack.log
