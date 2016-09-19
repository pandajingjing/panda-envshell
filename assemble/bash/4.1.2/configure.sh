#!/bin/sh

#do some configure script

info 'configure bash start.'
configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/bashrc' '/etc/bashrc' '#custom bashrc start from here:' '#custom bashrc end here.'
info 'configure bash successfully.'
