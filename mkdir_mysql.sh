#!/bin/sh

source ./common.sh

info 'make mysql directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_MYSQL
	make_dir $INSTALL_DIR_MYSQL
info 'make mysql directory success.'
