#!/bin/bash

#do some configure script

info 'configure nginx start.'
    create_dir $INSTALL_DIR_LOG_BIN
    create_dir $INSTALL_DIR_BIN_BIN'/conf/conf.d'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/total_release.proxy' $INSTALL_DIR_BIN_BIN'/conf/conf.d/total_release.proxy'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_dev.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_dev.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_test.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_test.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_release.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_release.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/static_dev.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/static_dev.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_dev.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_dev.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_test.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_test.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/php_release.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/php_release.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/static_dev.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/static_dev.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/static_test.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/static_test.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/static_release.server' $INSTALL_DIR_BIN_BIN'/conf/conf.d/static_release.server'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/nginx.conf' $INSTALL_DIR_BIN_BIN'/conf/nginx.conf'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/nginx.conf' $INSTALL_DIR_BIN_BIN'/conf/nginx.conf'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/total.upstream' $INSTALL_DIR_BIN_BIN'/conf/conf.d/total.upstream'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/total.proxy' $INSTALL_DIR_BIN_BIN'/conf/conf.d/total.proxy'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/total_dev.proxy' $INSTALL_DIR_BIN_BIN'/conf/conf.d/total_dev.proxy'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/conf.d/total_test.proxy' $INSTALL_DIR_BIN_BIN'/conf/conf.d/total_test.proxy'
info 'configure nginx successfully.'	
info 'add nginx service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/nginx' '/etc/init.d/nginx'
    /sbin/chkconfig --add nginx
    /sbin/chkconfig --level 3 nginx on
    info "`/sbin/chkconfig --list | /bin/grep nginx`"
info 'add nginx service successfully.'
info 'add nginx logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/nginx' '/etc/logrotate.d/nginx'
info 'add nginx logrotate successfully.'