#!/bin/sh
# check-g++.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

## Check for gcc.
g++ --version 1>/dev/null 2>&1 || { echo "ERROR: Install g++ before continuing."; exit 1; }
