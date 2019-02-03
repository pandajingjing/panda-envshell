#!/bin/sh

#do some install scripts

info 'install mysql start.'
rm /etc/my.cnf -rf
rm $LN_DIR_MYSQL -rf
cp -R $EXEC_DIR_TEMP$BIN_CODE_DIR $INSTALL_DIR_BIN
ln -s $INSTALL_DIR_BIN_BIN $LN_DIR_MYSQL
info 'install mysql successfully.'
