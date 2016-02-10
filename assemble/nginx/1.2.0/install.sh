#!/bin/bash

#do some install scripts

info 'configure nginx installation start.'
cd $EXEC_DIR_TEMP$BIN_CODE_DIR
./configure --prefix=$INSTALL_DIR_BIN_BIN --pid-path=$INSTALL_FILE_BIN_PID --user=$ENV_USER --group=$ENV_GROUP --with-http_ssl_module --with-http_gzip_static_module  --with-http_stub_status_module --with-pcre
info 'configure nginx installation successfully.'
info 'compile and install nginx start.'
make && make install
info 'compile and install nginx success.'