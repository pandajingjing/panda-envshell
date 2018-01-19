#!/bin/sh

#install all common lib for this scripts

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin_app "$@"

if [ -z $APP_VERSION ]; then
    error 'please specify version of page you want to associate.'
else
    # switch version
    APP_DIR=$INSTALL_DIR_APP'/page-release/'$APP_VERSION
    if [ -d $APP_DIR ]; then
        STATIC_DIR=$INSTALL_DIR_APP'/static-release'
        TMP_DIR=$EXEC_DIR_TEMP'/static'
        create_dir $TMP_DIR 'y'
        debug 'clone from '$GIT_STATIC' to '$TMP_DIR
        git clone $GIT_STATIC $TMP_DIR
        debug 'remove .git'
        rm -rf "$TMP_DIR/.git"
        debug 'copy '$TMP_DIR' to '$STATIC_DIR
        for FILE in `ls $TMP_DIR`
        do
            debug 'copy '$TMP_DIR'/'$FILE
            cp -rf $TMP_DIR'/'$FILE $STATIC_DIR
        done
        $STATIC_HASH_CMD $TMP_DIR $APP_NAME $APP_VERSION $STATIC_DIR
        chown -R $ENV_USER:$ENV_GROUP $STATIC_DIR
        chmod -R 0775 $STATIC_DIR
        info 'static of page('$APP_VERSION') published successfully.'
    else
        error $APP_DIR' does not exist.'
    fi
fi

