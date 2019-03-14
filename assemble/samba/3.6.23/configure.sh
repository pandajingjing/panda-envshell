#!/bin/sh

#do some configure script

info 'configure samba start.'
    create_dir $INSTALL_DIR_LOG_BIN
    create_dir $BIN_SHARE_PATH
    /bin/chmod -R 0777 $BIN_SHARE_PATH
    /bin/chown -R nobody:nobody $BIN_SHARE_PATH
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/smb.conf' '/etc/samba/smb.conf'
info 'configure samba successfully.'
info 'mod samba service start.'
    /sbin/chkconfig --level 3 smb on
    info "`/sbin/chkconfig --list | /bin/grep smb`"
info 'mod samba service successfully.'
info 'add samba logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/smb' '/etc/logrotate.d/smb'
info 'add samba logrotate successfully.'