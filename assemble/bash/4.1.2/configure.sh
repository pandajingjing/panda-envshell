#!/bin/sh

#do some configure script

info 'configure profile start.'
    create_dir $INSTALL_DIR_LOG_BIN
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/profile' '/etc/profile' '#custom profile start from here:' '#custom profile end here.'
info 'configure profile successfully.'
info 'add bash logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/bash' '/etc/logrotate.d/bash'
info 'add bash logrotate successfully.'