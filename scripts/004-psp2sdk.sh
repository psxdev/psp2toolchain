#!/bin/sh -e
# psp2sdk.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

set -e
if [ ! -d psp2sdk ]; then

## Download the source code.
git clone https://github.com/psp2dev/psp2sdk

fi
cd psp2sdk
git pull

echo Configure the build.
./autogen.sh --prefix=$PSP2SDK

echo Compiling and installing PSP2SDK to /usr/local/psp2
make -C src install -j8
make -C tools install -j8

echo Copying specs to $PSP2SDK/host-osx/arm-none-eabi/lib
cd $PSP2SDK
cp psp2.* $PSP2SDK/host-osx/arm-none-eabi/lib

echo Ready to have a lot of fun...


