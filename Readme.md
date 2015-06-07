
 ====================
 What does this do?
 ====================

  This program will automatically build and install a compiler and other
  tools used in the creation of homebrew software for the Sony PlayStation Vita
  videogame system (psp2).
  
  It is based on:
  
  * [ps3dev-mountain-lion](https://github.com/bigboss-ps3dev/ps3dev-mountain-lion) My builder for osx for Sony's toolchain and Sony's SDK and for ps3dev's toolchain and psl1ght's SDK.
  
  * [ps3toolchain](https://github.com/ps3dev/ps3toolchain) Homebrew toolchain for Sony PlayStation 3.
  
  * [buildscript](https://github.com/devkitPro/buildscripts)  Build script from devKitProARM i use some of their options to compile you can compare both option later in this readme.
  
 ==================
  How do I use it?
 ==================

 1) Set up your environment by installing the following software:

  
  On OSX i am using macport, if you installed already ps3dev toolchain from:
   https://github.com/ps3dev/ps3toolchain 
  you have almost every package needed if not dependence scripts will help you to know what is needed to install.


 2) Add the following to your login script:

  export PSP2=/usr/local/psp2

  export PATH=$PSP2/bin:$PSP2/host-osx/bin:$PATH
  
  I am using host-osx directory for toolchain binaries compiled with these scripts.

 3) Run the toolchain script:

  ./toolchain.sh
  
  ===========================
   Differences with devKitARM
  ===========================
  
  
  devKitARM output from file arm-none-eabi-gcc
  arm-none-eabi-gcc: Mach-O universal binary with 2 architectures: [i386: Mach-O i386 executable] [ppc]
  
  info about compiler:
  
  ./arm-none-eabi-gcc -v
  Using built-in specs.
  COLLECT_GCC=./arm-none-eabi-gcc
  COLLECT_LTO_WRAPPER=/usr/local/psp2/devkitARM.old/bin/../libexec/gcc/arm-none-eabi/4.9.2/lto-wrapper
  Target: arm-none-eabi
  Configured with: ../../gcc-4.9.2/configure --enable-languages=c,c++,objc,obj-c++ --with-gnu-as --with-gnu-ld --with-gcc --with-march=armv4t --enable-poison-system-directories --enable-interwork --enable-multilib --disable-dependency-tracking --enable-threads --disable-win32-registry --disable-nls --disable-debug --disable-libmudflap --disable-libssp --disable-libgomp --disable-libstdcxx-pch --target=arm-none-eabi --with-newlib --with-headers=../../newlib-2.2.0/newlib/libc/include --prefix=/opt/devkitpro/devkitARM --enable-lto --with-bugurl=http://wiki.devkitpro.org/index.php/Bug_Reports --with-pkgversion='devkitARM release 44'
  Thread model: single
  gcc version 4.9.2 (devkitARM release 44)
  
  osx output from file arm-none-eabi-gcc
  symbolic link to `arm-psp2-eabi-gcc'
  file arm-psp2-eabi-gcc
  arm-psp2-eabi-gcc: Mach-O 64-bit x86_64 executable
  
  ./arm-none-eabi-gcc -v
  Using built-in specs.
  COLLECT_GCC=./arm-none-eabi-gcc
  COLLECT_LTO_WRAPPER=/usr/local/psp2/host-osx/libexec/gcc/arm-psp2-eabi/4.9.2/lto-wrapper
  Target: arm-psp2-eabi
  Configured with: ../configure --prefix=/usr/local/psp2/host-osx --target=arm-psp2-eabi --enable-languages=c,c++,objc,obj-c++ --with-gnu-as --with-gnu-ld --with-gcc --enable-interwork --enable-multilib --with-newlib --disable-libssp --disable-libgomp --disable-nls --disable-debug --disable-libmudflap --disable-werror --enable-lto --with-headers=../newlib-/newlib/libc/include --with-march=armv7-r --enable-poison-system-directories --disable-win32-registry --disable-dependency-tracking --enable-threads --disable-libstdcxx-pch CXXFLAGS='-g -O2 -fbracket-depth=2048' CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2
  Thread model: single
  gcc version 4.9.2 (GCC)
  
  As you can see it is a X86_64 osx binary and i include only binutils and compilers for psp2 no more extras for other platforms that i am not going to use. Check -fbracket-depth=2048 option it was a nightmare with a depth bracket problem before find it and fix it.
  
  
 ======
  TODO
 ======
 
  * PSP2SDK installation. Right now it compiles only full sdk cloned from [psp2sdk](https://github.com/173210/psp2sdk) without errors. Check scripts folder.
  
  * PSP2 Loader. Waiting for yifanlu.
  
  * Samples for final user to run on PSP2 :P.
  
  
