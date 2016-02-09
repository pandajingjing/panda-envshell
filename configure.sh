#!/bin/bash

#configure what you need

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'configure '$BIN_NAME'('$BIN_VERSION') start.'

source_assemble_file 'config'

#find app dir
INSTALL_DIR_BIN_BIN=$INSTALL_DIR_BIN'/'$BIN_FULL_NAME

#start app configure script
EXEC_DIR_NOW=`pwd`
source_assemble_file 'configure.sh'
cd $EXEC_DIR_NOW

info 'configure '$BIN_NAME'('$BIN_VERSION') successfully.'