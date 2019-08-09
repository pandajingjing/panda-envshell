#!/bin/bash

#do some install scripts

showInfo 'compile and install redis start.'
    cd $sExecTempDir$sBinSourceCodeSubDir
    /usr/bin/make
    cd src
    /bin/cp `/bin/ls -hl | /bin/grep 'rwx' | /usr/bin/awk '{print $9}'` $sBinInstallDir/
showInfo 'compile and install redis successfully.'