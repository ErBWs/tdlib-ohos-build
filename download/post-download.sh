#!/bin/bash

set -eu

export DEST=$HOME/tdlib/arm64_build
mkdir -p $DEST

export OHOS_SDK=$HOME/tdlib/sdk/ohos-sdk/linux
export OHOS_NDK_HOME=$HOME/tdlib/sdk/ohos-sdk/linux
export PATH=${OHOS_NDK_HOME}/native/build-tools/cmake/bin:$PATH
export AS=${OHOS_NDK_HOME}/native/llvm/bin/llvm-as
export CC=${OHOS_NDK_HOME}/native/llvm/bin/aarch64-unknown-linux-ohos-clang
export CXX=${OHOS_NDK_HOME}/native/llvm/bin/aarch64-unknown-linux-ohos-clang++
export LD=${OHOS_NDK_HOME}/native/llvm/bin/ld.lld
export STRIP=${OHOS_NDK_HOME}/native/llvm/bin/llvm-strip
export RANLIB=${OHOS_NDK_HOME}/native/llvm/bin/llvm-ranlib
export OBJDUMP=${OHOS_NDK_HOME}/native/llvm/bin/llvm-objdump
export OBJCOPY=${OHOS_NDK_HOME}/native/llvm/bin/llvm-objcopy
export NM=${OHOS_NDK_HOME}/native/llvm/bin/llvm-nm
export AR=${OHOS_NDK_HOME}/native/llvm/bin/llvm-ar
export CFLAGS='-fPIC -D__MUSL__=1'
export CXXFLAGS='-fPIC -D__MUSL__=1'

export CORES=$(nproc)
