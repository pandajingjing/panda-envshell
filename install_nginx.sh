#!/bin/sh

source ./common.sh

info 'install nginx start.'
	unzip_bincode $BIN_NGINX
	install_check $BIN_NGINX
	info 'configure nginx start.'
		cd $EXEC_DIR_BINCODE/$BIN_NGINX
		$COMPILE_NGINX
	info 'configure nginx success.'
	info 'compile and install nginx start.'
		make && make install
	info 'compile and install nginx success.'
	cd $EXEC_DIR_BASE
info 'install nginx success.'

$EXEC_DIR_BASE/config_nginx.sh
$EXEC_DIR_BASE/service_nginx.sh
