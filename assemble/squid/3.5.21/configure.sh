#!/bin/bash

#do some configure script

info 'configure squid start.'
    create_dir $INSTALL_DIR_LOG_BIN
    chown -R $ENV_USER:$ENV_GROUP $BIN_CACHE_DIR
    chown -R $ENV_USER:$ENV_GROUP $BIN_COREDUMP_DIR
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/squid.conf $INSTALL_DIR_BIN_BIN/etc/squid.conf
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/squid.acl.conf $INSTALL_DIR_BIN_BIN/etc/squid.acl.conf
info 'configure squid successfully.'
info 'add squid service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/service/squid /etc/init.d/squid
    chkconfig --add squid
    chkconfig --level 3 squid on
    info "`chkconfig --list | grep squid`"
info 'add squid service successfully.'
info 'add squid logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/squid' '/etc/logrotate.d/squid'
info 'add squid logrotate successfully.'
