#!/bin/bash
set -e

# https://coreos.com/os/docs/latest/booting-on-openstack.html
wget \
  -O coreos_production_openstack_image.img.bz2 \
  https://stable.release.core-os.net/amd64-usr/current/coreos_production_openstack_image.img.bz2

bunzip2 coreos_production_openstack_image.img.bz2
