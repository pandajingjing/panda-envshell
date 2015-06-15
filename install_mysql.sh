#!/bin/sh

source ./common.sh

info 'install mysql start.'
        unzip_bincode $BIN_MYSQL
	install_check $BIN_MYSQL
	LN_DIR_MYSQL='/usr/local/mysql'
	rm /etc/my.cnf -rf
	rm $LN_DIR_MYSQL -rf
	cp -R $EXEC_DIR_BINCODE/$BIN_MYSQL $INSTALL_DIR_MYSQL
	ln -s $INSTALL_DIR_MYSQL $LN_DIR_MYSQL
        cd $EXEC_DIR_BASE
info 'install mysql success.'
info 'start mysql.'
	cd $LN_DIR_MYSQL
	scripts/mysql_install_db --user=$ENV_USER
	bin/mysqld_safe --user=$ENV_USER --log-error=$LOG_DIR_MYSQL/mysql.err --pid-file=$PID_PATH_MYSQL &
info 'mysql started.'
info 'configure mysql start.'
	warn 'input root password:'
	read pwd
	bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'%' identified by '$pwd'"
	bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'localhost' identified by '$pwd'"
info 'configure mysql success.'

$EXEC_DIR_BASE/service_mysql.sh
