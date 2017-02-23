#!/bin/bash

#do some configure script

info 'configure memcached start.'
    create_dir $INSTALL_DIR_LOG_BIN
info 'configure memcached successfully.'	
info 'add memcached service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/memcached' '/etc/init.d/memcached'
    chkconfig --add memcached
    chkconfig --level 3 memcached on
    info "`chkconfig --list | grep memcached`"
info 'add memcached service successfully.'
info 'add memcached logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/memcached' '/etc/logrotate.d/memcached'
info 'add memcached logrotate successfully.'
