#!/bin/bash
set -e

# https://github.com/coreos/container-linux-config-transpiler/releases

version=v0.6.0
filename=ct-$version-x86_64-unknown-linux-gnu

wget \
  -O $filename \
  https://github.com/coreos/container-linux-config-transpiler/releases/download/$version/$filename

[ -h ct ] && rm ct
ln -s $filename ct
