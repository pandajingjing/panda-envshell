#!/bin/bash

#do some install scripts

showInfo 'configure squid installation start.'
    cd $sExecTempDir$sBinSourceCodeSubDir
    ./configure --prefix=$sBinInstallDir --with-default-user=$sEnvUser --enable-stacktraces --enable-follow-x-forwarded-for --with-large-files --enable-gnuregex --enable-linux-netfilter --enable-icmp --enable-kill-parent-hack --enable-cache-digests
showInfo 'configure squid installation successfully.'
showInfo 'compile and install squid start.'
    /usr/bin/make && /usr/bin/make install
showInfo 'compile and install squid successfully.'