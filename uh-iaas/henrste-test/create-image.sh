#!/bin/bash
set -e

glance image-create --name "CoreOS" \
  --container-format bare \
  --disk-format qcow2 \
  --file coreos_production_openstack_image.img \
  --progress
