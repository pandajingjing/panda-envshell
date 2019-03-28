#!/bin/bash

#do some configure script

info 'configure sshd start.'
    create_dir $INSTALL_DIR_LOG_BIN
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/sshd_config' '/etc/ssh/sshd_config' 
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/rsyslog.conf' '/etc/rsyslog.conf' '#sshd log configuration start from here:' '#sshd log configuration end here.'
info 'configure sshd successfully.'
warn 'make sure your public key has saved ~/.ssh/authorized_keys.'
warn 'do not forget restart rsyslog service.'
info 'add sshd logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/sshd' '/etc/logrotate.d/sshd'
info 'add sshd logrotate successfully.'
if [ 'yesx' = "$BIN_REMOTE_TUNNEL"'x' ];then
    info 'add ssh remote tunnel service start.'
        configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/ssh_remote_tunnel' '/etc/init.d/ssh_remote_tunnel'
        /sbin/chkconfig --add ssh_remote_tunnel
        /sbin/chkconfig --level 3 ssh_remote_tunnel on
        info "`/sbin/chkconfig --list | /bin/grep ssh_remote_tunnel`"
    info 'add ssh remote tunnel service successfully.'
fi