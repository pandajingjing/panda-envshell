#!/bin/bash

#test all script configure and behaviour

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; /bin/pwd)
EXEC_DIR_ROOT=`/bin/readlink -f $EXEC_CURRENT_DIR/`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin "$@"

info 'test '"$BIN_NAME"'('"$BIN_VERSION"') start.'

source_assemble_file 'config'

info 'show all frame variables start.'
    for EXEC_CONFIGURE_NAME in $BIN_CONFIGURE_FRAME_VARS
    do
        eval EXEC_CONFIGURE_VAL="\$$EXEC_CONFIGURE_NAME"
        msg "$EXEC_CONFIGURE_NAME" "$EXEC_CONFIGURE_VAL"
    done
info 'show all frame variables successfully.'
info 'show all custom variables start.'
    for EXEC_CONFIGURE_NAME in $BIN_CONFIGURE_VARS
    do
        eval EXEC_CONFIGURE_VAL="\$$EXEC_CONFIGURE_NAME"
        msg "$EXEC_CONFIGURE_NAME" "$EXEC_CONFIGURE_VAL"
    done
info 'show all custom variables successfully.'

info 'test '"$BIN_NAME"'('"$BIN_VERSION"') successfully.'