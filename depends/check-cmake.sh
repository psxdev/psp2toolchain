#!/bin/sh
# check-make.sh by Antonio Jose Ramos Marquez aka bigboss (@psxdev)

## Check for make.
cmake --version  1>/dev/null 2>&1 || { echo "ERROR: Install cmake before continuing."; exit 1; }
