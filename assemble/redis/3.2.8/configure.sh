#!/bin/bash

#do some configure script

info 'configure redis start.'
    create_dir $INSTALL_DIR_LOG_BIN
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/redis.conf' $INSTALL_DIR_BIN_BIN'/redis.conf'
info 'configure redis successfully.'	
info 'add redis service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/redis' '/etc/init.d/redis'
    chkconfig --add redis
    chkconfig --level 3 redis on
    info "`chkconfig --list | grep redis`"
info 'add redis service successfully.'
info 'add redis logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/redis' '/etc/logrotate.d/redis'
info 'add redis logrotate successfully.'