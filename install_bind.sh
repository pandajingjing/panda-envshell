#!/bin/sh

source ./common.sh

info 'install bind start.'
        unzip_bincode $BIN_BIND
	install_check $BIN_BIND
        info 'configure bind start.'
                cd $EXEC_DIR_BINCODE/$BIN_BIND
                $COMPILE_BIND
        info 'configure bind success.'
        info 'compile and install bind start.'
                make && make install
        info 'compile and install bind success.'
        cd $EXEC_DIR_BASE
info 'install bind success.'

$EXEC_DIR_BASE/config_bind.sh
$EXEC_DIR_BASE/service_bind.sh
