#!/bin/sh

source ./common.sh

info 'make bind directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_BIND 1
	make_dir $INSTALL_DIR_BIND 1
info 'make bind directory success.'
