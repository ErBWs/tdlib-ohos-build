#!/bin/bash

set -eu

./download/download-sdk.sh
./download/download-deps.sh
./download/post-download.sh

./scripts/openssl.sh build
./scripts/tdlib.sh build
