#!/bin/bash

set -eu

pushd $HOME/tdlib/td

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf .build-native
	rm -rf .build-arm64
	exit 0
else
	exit 1
fi

mkdir -p .build-native
mkdir -p .build-arm64

# Generate TDLib source files
cd .build-native
cmake -DTD_GENERATE_SOURCE_FILES=ON ..
cmake --build .
cd ..

# Build TDLib
cd .build-arm64
cmake -L \
  -DCMAKE_TOOLCHAIN_FILE=$OHOS_NDK_HOME/native/build/cmake/ohos.toolchain.cmake \
  -DCMAKE_SKIP_RPATH=TRUE \
  -DOPENSSL_ROOT_DIR=$DEST/openssl \
  -DOHOS_STL=c++_static \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -GNinja \
  ..
cmake --build . --target tdjson

popd
