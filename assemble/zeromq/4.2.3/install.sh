#!/bin/bash

#do some install scripts

showInfo 'configure zeromq installation start.'
    cd $sExecTempDir$sBinSourceCodeSubDir
    ./configure --prefix=$sBinInstallDir
showInfo 'configure zeromq installation successfully.'
showInfo 'compile and install zeromq start.'
    /usr/bin/make && /usr/bin/make install
showInfo 'compile and install zeromq successfully.'