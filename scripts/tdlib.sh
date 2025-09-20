#!/bin/bash

set -eu

. ./download/post-download.sh

pushd $HOME/tdlib/td

if [ "$1" == "build" ]; then
  true
elif [ "$1" == "clean" ]; then
	rm -rf .build
else
	exit 1
fi

mkdir -p .build
cd .build

cmake -L \
  -DCMAKE_TOOLCHAIN_FILE=$OHOS_NDK_HOME/native/build/cmake/ohos.toolchain.cmake \
  -DCMAKE_SKIP_RPATH=TRUE \
  -DOPENSSL_ROOT_DIR=$DEST/openssl \
  -DOPENSSL_INCLUDE_DIR=$DEST/openssl/include \
  -DOPENSSL_CRYPTO_LIBRARY=$DEST/openssl/lib/libcrypto.a \
  -DOPENSSL_SSL_LIBRARY=$DEST/openssl/lib/libssl.a \
  -DOHOS_STL=c++_static \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -GNinja \
  ..
cmake --build . --target tdjson

rm libtdjson.so
$STRIP --strip-debug --strip-unneeded libtdjson.so.* -o  libtdjson.so

mkdir -p $DEST/tdlib
cp -p libtdjson.so $DEST/tdlib

popd
