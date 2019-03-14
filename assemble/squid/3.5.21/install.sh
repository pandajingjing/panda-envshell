#!/bin/bash

#do some install scripts

info 'configure squid installation start.'
    cd $EXEC_DIR_TEMP$BIN_CODE_DIR
    ./configure --prefix=$INSTALL_DIR_BIN_BIN --with-default-user=$ENV_USER --enable-stacktraces --enable-follow-x-forwarded-for --with-large-files --enable-gnuregex --enable-linux-netfilter --enable-icmp --enable-kill-parent-hack --enable-cache-digests
info 'configure squid installation successfully.'
info 'compile and install squid start.'
    /usr/bin/make && /usr/bin/make install
info 'compile and install squid successfully.'