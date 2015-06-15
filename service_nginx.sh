#!/bin/sh

source ./common.sh

info 'add nginx service start.'
	configure_bin $EXEC_DIR_SHELL/service/nginx /etc/init.d/nginx

	chkconfig --add nginx

	chkconfig --level 3 on nginx

	chkconfig --list
info 'add nginx service success.'
