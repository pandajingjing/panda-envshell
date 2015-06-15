#!/bin/sh

source ./common.sh

info 'configure php start.'
	cp $EXEC_DIR_BINCODE/$BIN_PHP/php.ini-development $INSTALL_DIR_PHP/lib/php.ini
	configure_bin $EXEC_DIR_BINCONF/php/php-fpm.conf $INSTALL_DIR_PHP/etc/php-fpm.conf
	$INSTALL_DIR_PHP/sbin/php-fpm -t
info 'configure php success.'
