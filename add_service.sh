#!/bin/sh

source ./config.sh

cp service_shell/* /etc/init.d/

chkconfig --add nginx
chkconfig --add php-fpm
chkconfig --add mysqld

chkconfig --list
