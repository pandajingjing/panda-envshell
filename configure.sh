#!/bin/bash

#configure what you need

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; /bin/pwd)
EXEC_DIR_ROOT=`/bin/readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'configure '"$BIN_NAME"'('"$BIN_VERSION"') start.'

source_assemble_file 'config'

#start app configure script
EXEC_DIR_NOW=`pwd`
source_assemble_file 'configure.sh'
cd $EXEC_DIR_NOW

info 'configure '"$BIN_NAME"'('"$BIN_VERSION"') successfully.'