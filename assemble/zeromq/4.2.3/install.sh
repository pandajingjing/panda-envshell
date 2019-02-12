#!/bin/bash

#do some install scripts

info 'configure zeromq installation start.'
    cd $EXEC_DIR_TEMP$BIN_CODE_DIR
    ./configure --prefix=$INSTALL_DIR_BIN_BIN
info 'configure zeromq installation successfully.'
info 'compile and install zeromq start.'
    make && make install
info 'compile and install zeromq successfully.'
