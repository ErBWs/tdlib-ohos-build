#!/bin/bash

set -eu

. ./download/deps-version.sh

cd $HOME/tdlib

# OpenSSL
if [ ! -d openssl ]; then
  curl -fsSL https://github.com/openssl/openssl/archive/refs/tags/$V_OPENSSL.tar.gz
  tar -zxf $V_OPENSSL.tar.gz
  rm $V_OPENSSL.tar.gz
fi

# TDLib
[ ! -d td ] && git clone https://github.com/tdlib/td.git td && cd td && git reset --hard $V_TDLIB && cd ..