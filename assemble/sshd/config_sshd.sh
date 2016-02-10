#!/bin/sh

source ./common.sh

info 'configure sshd start.'
	configure_bin $EXEC_DIR_BINCONF/sshd/sshd_config /etc/ssh/sshd_config
	/usr/sbin/sshd -t
info 'configure sshd success.'
