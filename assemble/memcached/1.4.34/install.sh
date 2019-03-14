#!/bin/bash

#do some install scripts

info 'configure memcached installation start.'
    cd $EXEC_DIR_TEMP$BIN_CODE_DIR
    ./configure --prefix=$INSTALL_DIR_BIN_BIN --enable-64bit --with-libevent=/usr/lib64
info 'configure memcached installation successfully.'
info 'compile and install memcached start.'
    /usr/bin/make && /usr/bin/make install
info 'compile and install memcached successfully.'