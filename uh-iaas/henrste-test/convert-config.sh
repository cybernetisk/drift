#!/bin/bash
set -e

./ct -in-file config.yaml -out-file config.ign -platform openstack-metadata -pretty
