#!/bin/sh

#do some configure script

info 'configure samba start.'
    create_dir $INSTALL_DIR_LOG_BIN
    create_dir $BIN_SHARE_PATH
    chmod -R 0777 $BIN_SHARE_PATH
    chown -R nobody:nobody $BIN_SHARE_PATH
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/smb.conf' '/etc/samba/smb.conf'
info 'configure samba successfully.'
info 'mod samba service start.'
    chkconfig --level 3 smb on
    info "`chkconfig --list | grep smb`"
info 'mod samba service successfully.'
