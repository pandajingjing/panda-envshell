#!/bin/sh

source ./common.sh

info 'make nginx directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_NGINX
	make_dir $INSTALL_DIR_NGINX
info 'make nginx directory success.'
