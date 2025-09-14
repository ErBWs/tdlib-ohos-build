#!/bin/bash

set -eu

. ./download/deps-version.sh

pushd $HOME/tdlib/$V_OPENSSL

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf .build
	exit 0
else
	exit 1
fi

popd
