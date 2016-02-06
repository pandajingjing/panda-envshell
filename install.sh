#!/bin/bash

#install what you need

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'install '$BIN_NAME'('$BIN_VERSION') start.'

source_assemble_file 'config'

#create base dir
create_dir $INSTALL_DIR_DATA
create_dir $INSTALL_DIR_BIN
create_dir $INSTALL_DIR_LOG
create_dir $INSTALL_DIR_APP

#create app dir
for EXEC_DIR_TEMP in $BIN_CREATE_DIR
do
	create_dir $EXEC_DIR_TEMP y
done

#empty app dir
INSTALL_DIR_BIN_APP=$INSTALL_DIR_BIN/$BIN_FULL_NAME
info 'app installed dir is: '$INSTALL_DIR_BIN_APP'.'
create_dir $INSTALL_DIR_BIN_APP y

#yum install its basic lib
if [ ! -z "$BIN_COMMON_LIB" ]; then
	info "we will install: '$BIN_COMMON_LIB' for your app installation."
	yum install -y $BIN_COMMON_LIB
	info 'app lib install successfully.'
fi

#start app install script
EXEC_DIR_NOW=`pwd`
source_assemble_file 'install.sh'
cd $EXEC_DIR_NOW

info 'install '$BIN_NAME'('$BIN_VERSION') successfully.'