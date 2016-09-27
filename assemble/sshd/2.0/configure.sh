#!/bin/sh

#do some configure script

info 'configure sshd start.'
configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/sshd_config' '/etc/ssh/sshd_config' 
info 'configure sshd successfully.'
info 'make sure your public key has saved ~/.ssh/authorized_keys.'
