#!/bin/sh

source ./common.sh

info 'install php start.'
        unzip_bincode $BIN_PHP
	install_check $BIN_PHP
        info 'configure php start.'
                cd $EXEC_DIR_BINCODE/$BIN_PHP
                $COMPILE_PHP
        info 'configure nginx success.'
        info 'compile and install php start.'
                make && make install
        info 'compile and install php success.'
        cd $EXEC_DIR_BASE
info 'install php success.'

$EXEC_DIR_BASE/config_php.sh
$EXEC_DIR_BASE/service_php.sh
