#!/bin/sh

set -e

npm run build

rm -Rf /usr/src/app-build/latest
mv /usr/src/app/build /usr/src/app-build/latest
