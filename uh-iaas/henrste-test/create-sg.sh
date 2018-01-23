#!/bin/bash
set -e

openstack security group create \
  --description "Allow incoming SSH" \
  henrste-ssh

openstack security group rule create \
  --src-ip 0.0.0.0/0 \
  --dst-port 22 \
  --protocol tcp \
  --ingress henrste-ssh

openstack security group create \
  --description "Allow incoming ICMP" \
  henrste-icmp

openstack security group rule create \
  --src-ip 0.0.0.0/0 \
  --protocol icmp \
  --ingress henrste-icmp
