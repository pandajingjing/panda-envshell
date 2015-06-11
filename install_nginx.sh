#!/bin/sh

source ./common.sh

info 'install nginx start.'
	unzip_bincode $BIN_NGINX
	info 'configure nginx start.'
		cd $EXEC_DIR_BINCODE/$BIN_NGINX
		$COMPILE_NGINX
	info 'configure nginx success.'
	info 'compile and install nginx start.'
		make && make install
	info 'compile and install nginx success.'
	cd $EXEC_DIR_BASE
info 'install nginx success.'

info 'configure nginx start.'
	mkdir $INSTALL_DIR_NGINX/conf/conf.d
        configure_bin $EXEC_DIR_BINCONF/nginx/nginx.conf $INSTALL_DIR_NGINX/conf/nginx.conf
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/total.upstream $INSTALL_DIR_NGINX/conf/conf.d/total.upstream
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/total.proxy $INSTALL_DIR_NGINX/conf/conf.d/total.proxy
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/total_dev.proxy $INSTALL_DIR_NGINX/conf/conf.d/total_dev.proxy
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/total_test.proxy $INSTALL_DIR_NGINX/conf/conf.d/total_test.proxy
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/total_release.proxy $INSTALL_DIR_NGINX/conf/conf.d/total_release.proxy
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/php_dev.server $INSTALL_DIR_NGINX/conf/conf.d/php_dev.server
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/php_test.server $INSTALL_DIR_NGINX/conf/conf.d/php_test.server
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/php_release.server $INSTALL_DIR_NGINX/conf/conf.d/php_release.server
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/static_dev.server $INSTALL_DIR_NGINX/conf/conf.d/static_dev.server
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/static_test.server $INSTALL_DIR_NGINX/conf/conf.d/static_test.server
	configure_bin $EXEC_DIR_BINCONF/nginx/conf.d/static_release.server $INSTALL_DIR_NGINX/conf/conf.d/static_release.server
        $INSTALL_DIR_NGINX/sbin/nginx -t
info 'configure nginx success.'
