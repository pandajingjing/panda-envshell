#!/bin/bash

#do some install scripts

info 'configure php installation start.'
cd $EXEC_DIR_TEMP$BIN_CODE_DIR
./configure --prefix=$INSTALL_DIR_BIN_BIN --with-fpm-user=$ENV_USER --with-fpm-group=$ENV_GROUP --enable-fpm --disable-short-tags --disable-ipv6 --with-zlib --with-pdo-mysql --enable-mbstring --with-openssl --enable-zip --with-mcrypt
info 'configure php installation successfully.'
info 'compile and install php start.'
make && make install
info 'compile and install php success.'