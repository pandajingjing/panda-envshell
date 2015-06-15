#!/bin/sh

source ./common.sh

info 'make bind directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_BIND
	make_dir $INSTALL_DIR_BIND
info 'make bind directory success.'
