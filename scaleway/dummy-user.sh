#!/bin/bash

# This user is used for mapping to a container user so that it is
# easier to have same permissions on host and in containers
# (Just use this user on the host)

groupadd -g 1000 dummy
useradd -g 1000 -M -N -u 1000 dummy
