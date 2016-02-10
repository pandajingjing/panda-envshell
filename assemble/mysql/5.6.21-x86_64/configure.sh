info 'make mysql directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_MYSQL 1
	make_dir $INSTALL_DIR_MYSQL 1
info 'make mysql directory success.'
info 'add mysql service start.'
	configure_bin $EXEC_DIR_SHELL/service/mysqld /etc/init.d/mysqld

	chkconfig --add mysqld

	chkconfig --level 3 on mysqld

	chkconfig --list
info 'add mysql service success.'