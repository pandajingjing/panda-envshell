#!/bin/sh

source ./common.sh

info 'add php-fpm service start.'
	configure_bin $EXEC_DIR_SHELL/service/php-fpm /etc/init.d/php-fpm

	chkconfig --add php-fpm

	chkconfig --level 3 on php-fpm

	chkconfig --list
info 'add php-fpm service success.'
