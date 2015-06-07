#!/bin/sh
# check-psp2.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

## Check if $PSP2 is set.
if test ! $PSP2; then { echo "ERROR: Set $PSP2 before continuing."; exit 1; } fi

## Check for the $PSP2 directory.
( ls -ld $PSP2 || mkdir -p $PSP2 ) 1>/dev/null 2>&1 || { echo "ERROR: Create $PSP2 before continuing."; exit 1; }

## Check for write permission.
touch $PSP2/test.tmp 1>/dev/null 2>&1 || { echo "ERROR: Grant write permissions for $PSP2 before continuing."; exit 1; }

## Check for $PSP2/bin in the path.
echo $PATH | grep $PSP2/bin 1>/dev/null 2>&1 || { echo "ERROR: Add $PSP2/bin to your path before continuing."; exit 1; }


## Check for $PSP2DEV/host-osx/bin in the path.
echo $PATH | grep $PSP2/host-osx/bin 1>/dev/null 2>&1 || { echo "ERROR: Add $PSP2/host-osx/bin to your path before continuing."; exit 1; }
