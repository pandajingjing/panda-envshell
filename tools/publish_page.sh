#!/bin/sh

#install all common lib for this scripts

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

parse_bin_app "$@"

if [ -z $APP_VERSION ]; then
    # git clone
    APP_VERSION=`date +"%Y%m%d%H%M%S"`
    APP_DIR=$INSTALL_DIR_APP'/page-release'/$APP_VERSION
    debug 'clone from '$GIT_PAGE' to '$APP_DIR
    git clone $GIT_PAGE $APP_DIR
    chown -R $ENV_USER:$ENV_GROUP $APP_DIR
    chmod -R 0775 $APP_DIR
    info 'page for '$APP_NAME' have been cloned to '$APP_DIR
else
    # switch version
    APP_DIR=$INSTALL_DIR_APP'/page-release/'$APP_VERSION
    if [ -d $APP_DIR ]; then
        VERSION_FILE=$INSTALL_DIR_APP'/version/page_'$APP_NAME'.ver'
        debug 'write '$APP_VERSION' to '$VERSION_FILE
        echo $APP_VERSION > $VERSION_FILE
        info 'page version of '$APP_NAME' switched to '$APP_VERSION
    else
        error $APP_DIR' does not exist.'
    fi
fi

