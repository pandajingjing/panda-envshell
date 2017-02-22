#!/bin/bash

#do some install scripts

cd $EXEC_DIR_TEMP$BIN_CODE_DIR
info 'compile and install redis start.'
make
cd src
cp `ls -hl | grep 'rwx' | awk '{print $9}'` $INSTALL_DIR_BIN_BIN/
info 'compile and install redis successfully.'
