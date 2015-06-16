#!/bin/sh

source ./common.sh

info 'make nginx directroy start.'
	$EXEC_DIR_BASE/make_dir.sh
	make_dir $LOG_DIR_NGINX 1
	make_dir $INSTALL_DIR_NGINX 1
info 'make nginx directory success.'
