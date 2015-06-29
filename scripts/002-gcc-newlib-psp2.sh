#!/bin/sh -e
# gcc-newlib-psp2.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

GCC="gcc-4.9.2"
NEWLIB="newlib-2.2.0"

if [ ! -d ${GCC} ]; then

  ## Download the source code.
  if [ ! -f ${GCC}.tar.bz2 ]; then wget --continue ftp://ftp.gnu.org/gnu/gcc/${GCC}/${GCC}.tar.bz2; fi
  if [ ! -f ${NEWLIB}.tar.gz ]; then wget --continue ftp://sources.redhat.com/pub/newlib/${NEWLIB}.tar.gz; fi

  ## Unpack the source code.
  rm -Rf ${GCC} && tar xfj ${GCC}.tar.bz2
  rm -Rf ${NEWLIB} && tar xfz ${NEWLIB}.tar.gz

  ## Patch the source code.
 cat ../patches/${GCC}.patch | patch -p1 -d ${GCC}
 cat ../patches/${NEWLIB}.patch | patch -p1 -d ${NEWLIB}

  ## Enter the source code directory.
  cd ${GCC}

  ## Create the newlib symlinks.
  #ln -s ../${NEWLIB}/newlib newlib
  #ln -s ../${NEWLIB}/libgloss libgloss

  ## Download the prerequisites.
  ./contrib/download_prerequisites

  ## Leave the source code directory.
  cd ..

fi

if [ ! -d ${GCC}/build-psp2 ]; then

  ## Create the build directory.
  mkdir ${GCC}/build-psp2

fi

## Enter the build directory.
cd ${GCC}/build-psp2

## Configure the build. In mavericks problem with depth bracket and clang fixed but you must not include in target the fix because it is not support fbracket option it was a little nightmare find it
../configure --prefix="$PSP2/host-osx" --target="arm-none-eabi" \
	--enable-languages="c,c++,objc,obj-c++" \
	--with-gnu-as \
	--with-gnu-ld \
	--with-gcc \
	--enable-interwork \
	--enable-multilib \
	--with-newlib \
	--disable-libssp \
	--disable-libgomp \
	--disable-nls \
	--disable-debug \
	--disable-libmudflap \
	--disable-werror \
	--enable-plugins \
	--enable-lto \
	--with-march=armv7-r \
	--with-cpu=cortex-a9 \
	--with-fpu=neon-fp16 \
	--enable-poison-system-directories \
	--disable-win32-registry \
	--disable-dependency-tracking \
	--disable-libstdcxx-pch \
	--disable-libstdcxx-verbose \
	 CXXFLAGS="-g -O2 -fbracket-depth=2048" CFLAGS_FOR_TARGET="-O2" CXXFLAGS_FOR_TARGET="-O2"



## Compile and install stage 1.
${MAKE:-make} -j 4 all-gcc #&& ${MAKE:-make} install
${MAKE:-make} -j 4 install-gcc
cd ../..
if [ ! -d ${NEWLIB}/build-psp2 ]; then

  ## Create the build directory.
  mkdir ${NEWLIB}/build-psp2

fi
## Compile and install newlib.
cd ${NEWLIB}/build-psp2

../configure --prefix="$PSP2/host-osx" --target="arm-none-eabi" \
	--disable-newlib-supplied-syscalls \
	--enable-newlib-mb 

${MAKE:-make}  #&& ${MAKE:-make} install
${MAKE:-make} install

cd ../..
## Compile and install stage 2.
cd ${GCC}/build-psp2
${MAKE:-make} all
${MAKE:-make} install

PSP2LIB="$PSP2/host-osx/arm-none-eabi/lib/psp2"
echo Installing libgcc and libsupc++ in $PSP2LIB

install -d $PSP2LIB $PSP2LIB/fpu $PSP2LIB/thumb
cd arm-none-eabi
install libgcc/libgcc.a "$PSP2LIB/libgcc.a"
install libstdc++-v3/libsupc++/.libs/libsupc++.a "$PSP2LIB/libsupc++.a"

cd armv6k/fpu
install libgcc/libgcc.a "$PSP2LIB/fpu/libgcc.a"
install libstdc++-v3/libsupc++/.libs/libsupc++.a "$PSP2LIB/fpu/libsupc++.a"
cd ../..

cd thumb
install libgcc/libgcc.a "$PSP2LIB/thumb/libgcc.a"
install libstdc++-v3/libsupc++/.libs/libsupc++.a "$PSP2LIB/thumb/libsupc++.a"
cd ../..
