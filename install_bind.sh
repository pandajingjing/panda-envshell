#!/bin/sh

source ./common.sh

info 'install bind start.'
        unzip_bincode $BIND
        info 'configure bind start.'
                cd $EXEC_DIR_BINCODE/$BIND
                $COMPILE_BIND
        info 'configure bind success.'
        info 'compile and install bind start.'
                make && make install
        info 'compile and install bind success.'
        cd $EXEC_DIR_BASE
info 'install bind success.'

info 'configure bind start.'
	mkdir $INSTALL_DIR_BIND/etc/default
	mkdir $INSTALL_DIR_BIND/etc/jxu
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
	configure_bin $EXEC_DIR_SHELL/tools/named_reload.sh $INSTALL_DIR_BIND/sbin/named_reload.sh
	chmod +x $INSTALL_DIR_BIND/sbin/named_reload.sh
	$INSTALL_DIR_BIND/sbin/named_reload.sh
info 'configure bind success.'
