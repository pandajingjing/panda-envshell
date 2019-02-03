#!/bin/bash

#extract what you need

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'extract '"$BIN_NAME"'('"$BIN_VERSION"') start.'

source_assemble_file 'config'

create_dir "$EXEC_DIR_TEMP"

if [ -z $BIN_CODE_TAR ];then
    error 'BIN_CODE_TAR is empty, we need it to find app source code tar.'
fi
if [ -z $BIN_CODE_DIR ];then
    error 'BIN_CODE_DIR is empty, we need it to put app source code.'
fi
EXEC_DIR_BIN_CODE=$EXEC_DIR_TEMP$BIN_CODE_DIR
EXEC_FILE_BIN_CODE_TAR=$EXEC_DIR_TAR'/'$BIN_CODE_TAR
debug 'extracted source code dir is: '"$EXEC_DIR_BIN_CODE"'.'
if [ -d $EXEC_DIR_BIN_CODE ];then
    debug 'source code dir is exists. clear it.'
    rm $EXEC_DIR_BIN_CODE -rf
fi
info 'extract source code: '"$EXEC_FILE_BIN_CODE_TAR"' start.'
tar -zxf "$EXEC_FILE_BIN_CODE_TAR" -C "$EXEC_DIR_TEMP"
info 'extract source code: '"$EXEC_FILE_BIN_CODE_TAR"' success.'

info 'extract '"$BIN_NAME"'('"$BIN_VERSION"') successfully.'
