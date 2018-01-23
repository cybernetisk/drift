#!/bin/bash
set -e

openstack keypair create --public-key ./cyb.pub cyb-at-uio
