#!/bin/bash
set -eu

if [ -z "${1:-}" ]; then
  echo "Missing path to released artifact"
  exit 1
fi

releasefile="$1"

if [ ! -e "$releasefile" ]; then
  echo "$releasefile not found"
  exit
fi

. .vars.sh

tempdir="$(mktemp -d)"

echo "Extracting artifact and injecting environment override"

pushd "$tempdir"
tar --strip-components=1 --no-same-owner -zxvf "$releasefile"
chmod 755 .
popd

cp -p "$env_subdir/env.js" "$tempdir/env.js"

echo "Replacing files served to client"

docker run \
  --rm \
  -v "$env_volume_dist":/usr/src/app-build \
  -v "$tempdir":/data \
  busybox \
  sh -c '
    rm -Rf /usr/src/app-build/latest
    cp -Rp /data /usr/src/app-build/latest
  '

echo "Cleaning up"

rm -Rf "$tempdir"
