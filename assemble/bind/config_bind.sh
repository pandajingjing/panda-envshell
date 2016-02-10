#!/bin/sh

source ./common.sh

info 'configure bind start.'
	make_dir $INSTALL_DIR_BIND/etc/default 1
	make_dir $INSTALL_DIR_BIND/etc/jxu 1
	$INSTALL_DIR_BIND/sbin/rndc-confgen > $INSTALL_DIR_BIND/etc/rndc.conf
	tail -10 $INSTALL_DIR_BIND/etc/rndc.conf | head -9 | sed 's/#//g' > $INSTALL_DIR_BIND/etc/named.conf
	echo "include \"$INSTALL_DIR_BIND/etc/named.ext.conf\";" >> $INSTALL_DIR_BIND/etc/named.conf
	configure_bin $EXEC_DIR_BINCONF/bind/named.ext.conf $INSTALL_DIR_BIND/etc/named.ext.conf
	configure_bin $EXEC_DIR_BINCONF/bind/jxu/zone.conf $INSTALL_DIR_BIND/etc/jxu/zone.conf
	configure_bin $EXEC_DIR_BINCONF/bind/jxu/named.conf $INSTALL_DIR_BIND/etc/jxu/named.conf
	configure_bin $EXEC_DIR_BINCONF/bind/default/named.default.zone $INSTALL_DIR_BIND/etc/default/named.default.zone
	configure_bin $EXEC_DIR_BINCONF/bind/default/named.empty $INSTALL_DIR_BIND/etc/default/named.empty
	configure_bin $EXEC_DIR_BINCONF/bind/default/named.localhost $INSTALL_DIR_BIND/etc/default/named.localhost
	configure_bin $EXEC_DIR_BINCONF/bind/default/named.loopback $INSTALL_DIR_BIND/etc/default/named.loopback
	configure_bin $EXEC_DIR_BINCONF/bind/default/named.root $INSTALL_DIR_BIND/etc/default/named.root
	$INSTALL_DIR_BIND/sbin/named-checkconf $INSTALL_DIR_BIND/etc/named.conf
	$INSTALL_DIR_BIND/sbin/named-checkzone jxu.life $INSTALL_DIR_BIND/etc/jxu/zone.conf
info 'configure bind success.'
