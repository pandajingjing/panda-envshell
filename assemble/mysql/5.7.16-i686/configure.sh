#!/bin/bash

#do some configure script

showInfo 'add mysql service start.'
    configBin $sExecBinVersionAssembleDir'/service/mysqld' '/etc/init.d/mysqld'
    /sbin/chkconfig --add mysqld
    /sbin/chkconfig --level 3 mysqld on
    showInfo "`/sbin/chkconfig --list | /bin/grep mysqld`"
showInfo 'add mysql service successfully.'
showInfo 'start mysql.'
    createDir $sBinLogInstallDir
    /bin/touch $sBinLogInstallDir/mysql.err.log
    /bin/chown $sEnvUser:$sEnvGroup $sBinLogInstallDir/mysql.err.log
    cd $LN_DIR_MYSQL
    /bin/rm ./my.cnf -rf
    bin/mysqld --initialize-insecure --user=$sEnvUser
    bin/mysqld_safe $BIN_START_PARAM &
showInfo 'mysql started.'
showInfo 'configure mysql start.'
    read -p 'input root password:' PWD
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot --port=$iBinListenPort -e "grant all privileges on *.* to root@'%' identified by '$PWD'"
    $LN_DIR_MYSQL/bin/mysql -h127.0.0.1 -uroot --port=$iBinListenPort -e "grant all privileges on *.* to root@'localhost' identified by '$PWD'"
showInfo 'configure mysql successfully.'