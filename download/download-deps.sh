#!/bin/bash

set -eu

. ./download/deps-version.sh

cd $HOME/tdlib

# OpenSSL
if [ ! -d openssl ] && git clone --depth 1 -b $V_OPENSSL https://github.com/openssl/openssl.git openssl

# TDLib
[ ! -d td ] && git clone https://github.com/tdlib/td.git td && cd td && git reset --hard $V_TDLIB && cd ..