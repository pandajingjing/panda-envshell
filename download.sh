#!/bin/bash

#download what you need

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'download '$BIN_NAME'('$BIN_VERSION') start.'

source_assemble_file 'config'

create_dir $EXEC_DIR_TAR

info "download $BIN_DOWNLOAD_URL start."
wget -P $EXEC_DIR_TAR -c $BIN_DOWNLOAD_URL
info "download $BIN_DOWNLOAD_URL successfully."

info 'download '$BIN_NAME'('$BIN_VERSION') successfully.'