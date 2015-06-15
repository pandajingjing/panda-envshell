#!/bin/sh

source ./common.sh

info 'add mysql service start.'
	configure_bin $EXEC_DIR_SHELL/service/mysqld /etc/init.d/mysqld

	chkconfig --add mysqld

	chkconfig --level 3 on mysqld

	chkconfig --list
info 'add mysql service success.'
