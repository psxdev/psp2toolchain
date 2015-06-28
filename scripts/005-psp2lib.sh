#!/bin/sh -e
# psp2lib.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

set -e
PSP2LIBDIR=$PSP2SDK/host-osx
if [ ! -d psp2lib ]; then
## Download the source code.
git clone https://github.com/psp2dev/psp2lib

fi
cd psp2lib
git pull

echo Configure the build.
mkdir -p out/lib/fpu
cd out/lib
echo Running src/autogen.sh
../../src/autogen.sh -q --prefix=$PSP2LIBDIR
echo Done running src/autogen.sh
echo Compiling libsysbase
make -j8
echo Installing libsysbase
make install
echo Running src/autogen.sh enabling FPU
cd fpu
../../../src/autogen.sh -q --with-fpu --prefix=$PSP2LIBDIR
echo Done running src/autogen.sh with fpu enabled
echo Compiling  libsysbase with fpu option
make -j8
echo Installing  libsysbase with fpu option
make install



echo Ready to have a lot of fun...


