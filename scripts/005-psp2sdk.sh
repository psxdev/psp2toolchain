#!/bin/sh -e
# psp2sdk.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

set -e
if [ ! -d psp2sdk ]; then

## Download the source code.
git clone https://github.com/173210/psp2sdk

fi
cd psp2sdk
git pull

## Configure the build.
./autogen.sh

cd src
./autogen.sh
make

cd ../tools
./autogen.sh
make

echo "TODO SDK INSTALLATION " 
