#!/bin/bash

set -eu

. ./download/deps-version.sh

# Download OpenHarmony SDK
mkdir -p $HOME/tdlib/sdk
cd $HOME/tdlib/sdk
curl -fsSL https://repo.huaweicloud.com/openharmony/os/${V_SDK}/ohos-sdk-windows_linux-public.tar.gz
tar -zxf ohos-sdk-windows_linux-public.tar.gz
rm ohos-sdk-windows_linux-public.tar.gz

# Clear useless folders
cd ohos-sdk
rm -rf ohos
rm -rf windows

# Extract NDK
cd linux
for i in *.zip
do
  unzip -q $i
  rm $i
done
