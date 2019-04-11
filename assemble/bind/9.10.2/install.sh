#!/bin/bash

#do some install scripts

showInfo 'configure bind installation start.'
    cd $sExecTempDir$sBinSourceCodeSubDir
    ./configure --prefix="$sBinInstallDir" --enable-largefile --enable-threads
showInfo 'configure bind installation successfully.'
showInfo 'compile and install bind start.'
    /usr/bin/make && /usr/bin/make install
showInfo 'compile and install bind successfully.'