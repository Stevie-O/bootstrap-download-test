#!/bin/bash

# abort if any command fails
set -e
# if any command in a pipeline fails, fail the whole command
set -o pipefail

REPO='Stevie-O/bootstrap-download-test'
LATEST_INFO_URL="https://api.github.com/repos/$REPO/releases/latest"

LATEST_TARBALL_URL=`curl -s -S -L "$LATEST_INFO_URL" -o - | grep -Po '"tarball_url": "\K([^"]+)'`

mkdir -p bdt-files
cd bdt-files
curl -s -S -L "$LATEST_TARBALL_URL" -o - | tar -x -z -v --strip-components=1
. ./main.sh
