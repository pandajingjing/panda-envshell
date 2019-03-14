#!/bin/bash

#do some configure script

info 'configure squid start.'
    create_dir $INSTALL_DIR_LOG_BIN
    /bin/chown -R $ENV_USER:$ENV_GROUP $BIN_CACHE_DIR
    /bin/chown -R $ENV_USER:$ENV_GROUP $BIN_COREDUMP_DIR
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/squid.conf $INSTALL_DIR_BIN_BIN/etc/squid.conf
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/squid.acl.conf $INSTALL_DIR_BIN_BIN/etc/squid.acl.conf
info 'configure squid successfully.'
info 'add squid service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/service/squid /etc/init.d/squid
    /sbin/chkconfig --add squid
    /sbin/chkconfig --level 3 squid on
    info "`/sbin/chkconfig --list | /bin/grep squid`"
info 'add squid service successfully.'
info 'add squid logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/squid' '/etc/logrotate.d/squid'
info 'add squid logrotate successfully.'