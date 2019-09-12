#!/bin/bash

#do some install scripts

showInfo 'install mysql start.'
    /bin/rm /etc/my.cnf -rf
    /bin/rm $LN_DIR_MYSQL -rf
    /bin/cp -R $sExecTempDir$sBinSourceCodeSubDir $sBinInstallRootDir
    /bin/ln -s $sBinInstallDir $LN_DIR_MYSQL
showInfo 'install mysql successfully.'