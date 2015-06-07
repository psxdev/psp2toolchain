#!/bin/sh 
# toolchain-sudo.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

## Enter the psp2toolchain directory.
cd "`dirname $0`" || { echo "ERROR: Could not enter the psp2toolchain directory."; exit 1; }

## Set up the environment.
export PSP2=/usr/local/psp2
OS=`uname`
if [ $OS = "Darwin" ]; then
LD_LIBRARY_PATH=/opt/local/lib;export LD_LIBRARY_PATH
fi
## Set up the path.
export PATH=$PSP2/bin:$PSP/host-osx/bin:$PATH

## Run the toolchain script.
./toolchain.sh $@ || { echo "ERROR: Could not run the toolchain script."; exit 1; }
