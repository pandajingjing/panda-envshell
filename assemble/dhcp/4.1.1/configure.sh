#!/bin/sh

#do some configure script

info 'configure dhcpd start.'
    create_dir $INSTALL_DIR_LOG_BIN
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/dhcpd.conf' '/etc/dhcp/dhcpd.conf'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/rsyslog.conf' '/etc/rsyslog.conf' '#dhcpd log configuration start from here:' '#dhcpd log configuration end here.'
info 'configure dhcpd successfully.'
info 'mod dhcpd service start.'
    chkconfig --level 3 dhcpd on
    info "`chkconfig --list | grep dhcpd`"
info 'mod dhcpd service successfully.'
