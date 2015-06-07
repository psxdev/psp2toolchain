#!/bin/sh -e
# gdb-psp2.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

GDB="gdb-7.8.2"

if [ ! -d ${GDB} ]; then

  ## Download the source code.
  if [ ! -f ${GDB}.tar.gz ]; then wget --continue ftp://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi

  ## Unpack the source code.
  tar xfvj ${GDB}.tar.gz

## Patch the source code.
 # cat ../patches/${GDB}-armosx-bug141540.patch | patch -p1 -d ${GDB}
 cat ../patches/${GDB}.patch | patch -p1 -d ${GDB}
 
fi

if [ ! -d ${GDB}/build-psp2 ]; then

  ## Create the build directory.
  mkdir ${GDB}/build-psp2

fi

## Enter the build directory.
cd ${GDB}/build-psp2



## Configure the build.
../configure --prefix="$PSP2/host-osx" --target="arm-psp2-eabi" \
    --enable-multilib \
    --enable-interwork \
	--disable-nls \
	--disable-dependency-tracking \
    --disable-werror

## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
