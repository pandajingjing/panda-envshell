#!/bin/bash

#do some install scripts

info 'install mysql start.'
    /bin/rm /etc/my.cnf -rf
    /bin/rm $LN_DIR_MYSQL -rf
    /bin/cp -R $EXEC_DIR_TEMP$BIN_CODE_DIR $INSTALL_DIR_BIN
    /bin/ln -s $INSTALL_DIR_BIN_BIN $LN_DIR_MYSQL
info 'install mysql successfully.'