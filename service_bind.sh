#!/bin/sh

source ./common.sh

info 'add bind service start.'
	configure_bin $EXEC_DIR_SHELL/service/bind /etc/init.d/bind 

	chkconfig --add bind

	chkconfig --level 3 on bind

	chkconfig --list
info 'add bind service success.'
