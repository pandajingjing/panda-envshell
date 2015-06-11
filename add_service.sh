#!/bin/sh

source ./common.sh

info 'add service start.'
	configure_bin $EXEC_DIR_SHELL/service/nginx /etc/init.d/nginx
	configure_bin $EXEC_DIR_SHELL/service/php-fpm /etc/init.d/php-fpm
	configure_bin $EXEC_DIR_SHELL/service/mysqld /etc/init.d/mysqld
	configure_bin $EXEC_DIR_SHELL/service/bind /etc/init.d/bind 

	chkconfig --add nginx
	chkconfig --add php-fpm
	chkconfig --add mysqld
	chkconfig --add bind

	chkconfig --level 3 on nginx
	chkconfig --level 3 on php-fpm
	chkconfig --level 3 on mysqld
	chkconfig --level 3 on bind

	chkconfig --list
info 'add service success.'
