#!/bin/bash

#do some install scripts

showInfo 'configure memcached installation start.'
    cd $sExecTempDir$sBinSourceCodeSubDir
    ./configure --prefix=$sBinInstallDir --enable-64bit --with-libevent=/usr/lib64
showInfo 'configure memcached installation successfully.'
showInfo 'compile and install memcached start.'
    /usr/bin/make && /usr/bin/make install
showInfo 'compile and install memcached successfully.'