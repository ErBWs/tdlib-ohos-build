#!/bin/bash

set -eu

. ./download/post-download.sh

pushd $HOME/tdlib/td

if [ "$1" == "generate" ]; then       # Generate TDLib source files
  unset_build_env
  mkdir -p .build-native
  cd .build-native
  cmake -DTD_GENERATE_SOURCE_FILES=ON ..
  cmake --build .
  cd ..
elif [ "$1" == "build" ]; then        # Build TDLib
  setup_build_env
  mkdir -p .build-arm64
  cd .build-arm64
  cmake -L \
    -DCMAKE_TOOLCHAIN_FILE=$OHOS_NDK_HOME/native/build/cmake/ohos.toolchain.cmake \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DOPENSSL_ROOT_DIR=$DEST/openssl \
    -DOPENSSL_CRYPTO_LIBRARY=$DEST/openssl/lib/libcrypto.a \
    -DOPENSSL_SSL_LIBRARY=$DEST/openssl/lib/libssl.a \
    -DOHOS_STL=c++_static \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -GNinja \
    ..
  cmake --build . --target tdjson
elif [ "$1" == "clean-generate" ]; then
	rm -rf .build-native
else
elif [ "$1" == "clean-build" ]; then
	rm -rf .build-arm64
else
elif [ "$1" == "clean" ]; then
	rm -rf .build-native
	rm -rf .build-arm64
else
	exit 1
fi

popd
