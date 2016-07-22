#!/bin/bash

set -e

./update-source.sh

./build.sh

./build-app.sh
