#!/bin/sh

set -e

node_modules/.bin/gulp build

rm -Rf /usr/src/app-build/latest
mv /usr/src/app/build /usr/src/app-build/latest
