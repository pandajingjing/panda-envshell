#!/bin/bash

#do some configure script

info 'add mysql service start.'
    configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/service/mysqld' '/etc/init.d/mysqld'
    /sbin/chkconfig --add mysqld
    /sbin/chkconfig --level 3 mysqld on
    info "`/sbin/chkconfig --list | /bin/grep mysqld`"
info 'add mysql service successfully.'
info 'start mysql.'
    create_dir $INSTALL_DIR_LOG_BIN
    /bin/touch $INSTALL_DIR_LOG_BIN/mysql.err.log
    /bin/chown $ENV_USER:$ENV_GROUP $INSTALL_DIR_LOG_BIN/mysql.err.log
    cd $LN_DIR_MYSQL
    /bin/rm ./my.cnf -rf
    bin/mysqld --initialize-insecure --user=$ENV_USER
    bin/mysqld_safe $BIN_START_PARAM &
info 'mysql started.'
info 'configure mysql start.'
    read -p 'input root password:' PWD
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot --port=$BIN_PORT -e "grant all privileges on *.* to root@'%' identified by '$PWD'"
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot --port=$BIN_PORT -e "grant all privileges on *.* to root@'localhost' identified by '$PWD'"
info 'configure mysql successfully.'