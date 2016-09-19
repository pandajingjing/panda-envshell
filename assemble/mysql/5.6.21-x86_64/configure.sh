#!/bin/bash

#do some configure script

info 'add mysql service start.'
	configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/mysqld' '/etc/init.d/mysqld'
	chkconfig --add mysqld
	chkconfig --level 3 mysqld on
	info "`chkconfig --list | grep mysqld`"
info 'add mysql service successfully.'
info 'start mysql.'
    create_dir $INSTALL_DIR_LOG_BIN
	cd $LN_DIR_MYSQL
	scripts/mysql_install_db --user=$ENV_USER
	bin/mysqld_safe $BIN_START_PARAM &
info 'mysql started.'
info 'configure mysql start.'
    warn 'input root password:'
    read pwd
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'%' identified by '$pwd'"
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'localhost' identified by '$pwd'"
info 'configure mysql successfully.'
