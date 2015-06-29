#!/bin/sh -e
# binutils-psp2.sh 

BINUTILS="binutils-2.25"

if [ ! -d ${BINUTILS} ]; then

  ## Download the source code.
  if [ ! -f ${BINUTILS}.tar.bz ]; then wget --continue ftp://ftp.gnu.org/gnu/binutils/${BINUTILS}.tar.bz2; fi

  ## Unpack the source code.
  tar xfj ${BINUTILS}.tar.bz2

  ## Patch the source code.
  cat ../patches/binutils-2.25.patch | patch -p1 -d ${BINUTILS}

fi

if [ ! -d ${BINUTILS}/build-psp2 ]; then

  ## Create the build directory.
  mkdir ${BINUTILS}/build-psp2

fi

## Enter the build directory.
cd ${BINUTILS}/build-psp2

## Configure the build.
../configure --prefix="$PSP2/host-osx" --target="arm-none-eabi" \
	--disable-nls \
	--disable-dependency-tracking \
	--disable-werror \
	--enable-lto \
	--enable-plugins \
	--enable-poison-system-directories




## Compile and install.
${MAKE:-make} -j 4 && ${MAKE:-make} install
