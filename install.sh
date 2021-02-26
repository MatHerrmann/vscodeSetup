#!/bin/bash

BASE_URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm"
PACKAGE_RELEASE_INFO="9-2020"
PACKAGE_RELEASE_QUARTER="q2"
PACKAGE_VERSION="gcc-arm-none-eabi-$PACKAGE_RELEASE_INFO-$PACKAGE_RELEASE_QUARTER-update"
PACKAGE_VERSION_PLATFORM_FILE_NAME="$PACKAGE_VERSION-x86_64-linux.tar.bz2"



if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


apt-get update
apt-get install -y curl git vim wget ca-certificates openssl w3m bzip2
apt remove -y binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-arm-none-eabi
wget "$BASE_URL/$PACKAGE_RELEASE_INFO$PACKAGE_RELEASE_QUARTER/$PACKAGE_VERSION_PLATFORM_FILE_NAME"
tar xvf "$PACKAGE_VERSION_PLATFORM_FILE_NAME"
rm "$PACKAGE_VERSION_PLATFORM_FILE_NAME"
if [[ -d "/opt/$PACKAGE_VERSION" ]]; then
    rm -rf "/opt/$PACKAGE_VERSION"
fi
mv "$PACKAGE_VERSION" /opt
export PATH="$PATH:/opt/$PACKAGE_VERSION/bin"
