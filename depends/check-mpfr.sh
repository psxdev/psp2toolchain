#!/bin/sh
# check-mpfr.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

[ -f /usr/include/mpfr.h -o -f /opt/local/include/mpfr.h -o -f /usr/local/include/mpfr.h -o -f /opt/csw/include/mpfr.h ] || { echo "ERROR: Install mpfr before continuing."; exit 1; }
