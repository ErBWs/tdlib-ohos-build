#!/bin/bash

set -eu

. ./download/deps-version.sh

pushd $HOME/tdlib/openssl

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf .build
	exit 0
else
	exit 1
fi

mkdir -p .build
cd .build

../Configure linux-aarch64 no-shared no-tests --prefix=$DEST/openssl
make -j$CORES

# https://github.com/openssl/openssl/issues/8170
make install_sw

popd
