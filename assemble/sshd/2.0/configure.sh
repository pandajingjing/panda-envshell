#!/bin/sh

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