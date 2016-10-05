#!/bin/bash

#do some configure script

info 'configure php-fpm start.'
    create_dir $INSTALL_DIR_LOG_BIN
    configure_bin $EXEC_DIR_TEMP$BIN_CODE_DIR/php.ini-development $INSTALL_DIR_BIN_BIN/lib/php.ini
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/php-fpm.conf $INSTALL_DIR_BIN_BIN/etc/php-fpm.conf
info 'configure php-fpm successfully.'
info 'add php-fpm service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/service/php-fpm /etc/init.d/php-fpm
    chkconfig --add php-fpm
    chkconfig --level 3 php-fpm on
    info "`chkconfig --list | grep php-fpm`"
info 'add php-fpm service successfully.'
info 'add php-fpm logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/php-fpm' '/etc/logrotate.d/php-fpm'
info 'add php-fpm logrotate successfully.'
