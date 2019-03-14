#!/bin/bash

#do some configure script

info 'configure bind start.'
    create_dir "$INSTALL_DIR_LOG_BIN"
    create_dir "$INSTALL_DIR_BIN_BIN"/etc/default
    create_dir "$INSTALL_DIR_BIN_BIN"/etc/mydomain

    $INSTALL_DIR_BIN_BIN/sbin/rndc-confgen > $INSTALL_DIR_BIN_BIN/etc/rndc.conf
    /usr/bin/tail -10 $INSTALL_DIR_BIN_BIN/etc/rndc.conf | /usr/bin/head -9 | /bin/sed 's/#//g' > $INSTALL_DIR_BIN_BIN/etc/named.conf
    /bin/echo "include \"$INSTALL_DIR_BIN_BIN/etc/named.ext.conf\";" >> $INSTALL_DIR_BIN_BIN/etc/named.conf

    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/named.ext.conf $INSTALL_DIR_BIN_BIN/etc/named.ext.conf
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/mydomain/zone.conf $INSTALL_DIR_BIN_BIN/etc/mydomain/zone.conf
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/mydomain/named.conf $INSTALL_DIR_BIN_BIN/etc/mydomain/named.conf
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/default/named.default.zone $INSTALL_DIR_BIN_BIN/etc/default/named.default.zone
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/default/named.empty $INSTALL_DIR_BIN_BIN/etc/default/named.empty
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/default/named.localhost $INSTALL_DIR_BIN_BIN/etc/default/named.localhost
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/default/named.loopback $INSTALL_DIR_BIN_BIN/etc/default/named.loopback
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION/conf/default/named.root $INSTALL_DIR_BIN_BIN/etc/default/named.root

    $INSTALL_DIR_BIN_BIN/sbin/named-checkconf $INSTALL_DIR_BIN_BIN/etc/named.conf
    $INSTALL_DIR_BIN_BIN/sbin/named-checkzone $BIN_DOMAIN $INSTALL_DIR_BIN_BIN/etc/mydomain/zone.conf

info 'configure bind successfully.'           
info 'add bind service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/bind' '/etc/init.d/bind'
    /sbin/chkconfig --add bind
    /sbin/chkconfig --level 3 bind on
    info "`/sbin/chkconfig --list | /bin/grep bind`"
info 'add bind service successfully.'
info 'add bind logrotate start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/logrotate/bind' '/etc/logrotate.d/bind'
info 'add bind logrotate successfully.'