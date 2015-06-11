#!/bin/sh

source ./common.sh

info 'install php start.'
        unzip_bincode $BIN_PHP
        info 'configure php start.'
                cd $EXEC_DIR_BINCODE/$BIN_PHP
                $COMPILE_PHP
        info 'configure nginx success.'
        info 'compile and install php start.'
                make && make install
        info 'compile and install php success.'
        cd $EXEC_DIR_BASE
info 'install php success.'

info 'configure php start.'
	cp $EXEC_DIR_BINCODE/$BIN_PHP/php.ini-development $INSTALL_DIR_PHP/lib/php.ini
	configure_bin $EXEC_DIR_BINCONF/php/php-fpm.conf $INSTALL_DIR_PHP/etc/php-fpm.conf
	$INSTALL_DIR_PHP/sbin/php-fpm -t
info 'configure php success.'
