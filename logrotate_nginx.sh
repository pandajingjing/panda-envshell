#!/bin/sh

source ./common.sh

info 'add nginx logrotate start.'
	configure_bin $EXEC_DIR_SHELL/logrotate/nginx /etc/logrotate.d/nginx
info 'add nginx logrotate success.'
