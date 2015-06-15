#!/bin/sh

source ./common.sh

info 'make common directroy start.'
	make_dir $INSTALL_DIR_DATA
	make_dir $INSTALL_DIR_BIN
	make_dir $INSTALL_DIR_LOG
	make_dir $INSTALL_DIR_APP
info 'make common directory success.'
