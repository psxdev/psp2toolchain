#!/bin/sh -e
# symlinks-ARM.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)


## Enter the bin directory in host-osx.
cd ${PSP2}/host-osx/bin

## Create the symlinks for none-eabi.
for i in `ls arm-psp2-eabi-* | cut -c15-`; do
  if [ ! -f arm-none-eabi-${i} -a ! -h arm-none-eabi-${i} -a -f arm-psp2-eabi-${i} ]; then
    ln -s arm-psp2-eabi-${i} arm-none-eabi-${i}
  fi
done

