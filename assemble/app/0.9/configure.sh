#!/bin/sh

#do some configure script

info 'configure app start.'
    create_dir $INSTALL_DIR_LOG_BIN
info 'configure app successfully.'
info 'add app logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/app' '/etc/logrotate.d/app'
info 'add app logrotate successfully.'