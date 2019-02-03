#!/bin/bash

#do some install scripts

info 'configure bind installation start.'
cd $EXEC_DIR_TEMP$BIN_CODE_DIR
./configure --prefix="$INSTALL_DIR_BIN_BIN" --enable-largefile --enable-threads
info 'configure bind installation successfully.'
info 'compile and install bind start.'
make && make install
info 'compile and install bind successfully.'
