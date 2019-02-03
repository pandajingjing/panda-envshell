#!/bin/sh

#do some configure script

info 'configure profile start.'
configure_bin $EXEC_DIR_ASSEMBLE_BIN_VERSION'/conf/profile' '/etc/profile' '#custom profile start from here:' '#custom profile end here.'
info 'configure profile successfully.'
