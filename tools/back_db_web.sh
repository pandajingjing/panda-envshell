#!/bin/sh

#backup specific database and app files

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

DATABASES=$1

if [ -z "$DATABASES" ];then
    error 'please specify databases.'
fi

DATAPATH='/usr/local/mysql/data'
BACKUPFIX=`date "+%Y%m%d%H%M%S"`
BACKPATH=$INSTALL_DIR_DATA'/backup'
EXEC_DIR_NOW=`pwd`

create_dir $BACKPATH

debug 'backup fix: '$BACKUPFIX
cd $DATAPATH
for DATABASE in $DATABASES
do
    info 'start backup database: '$DATABASE'.'
    if [ -d $DATABASE ];then
        BACKUPFILE=$BACKPATH'/'$BACKUPFIX.mysql.$DATABASE.tar.gz
        debug "tar -zcf $BACKUPFILE $DATABASE"
        tar -zcf $BACKUPFILE $DATABASE
    else
        error $DATABASE' does not exists.'
    fi
    info 'backup database: '$DATABASE' finished.'
done
cd $EXEC_DIR_NOW

info 'start bacup web.'
    cd $INSTALL_DIR_DATA
    BACKUPFILE=$BACKPATH'/'$BACKUPFIX.web.tar.gz
    debug "tar -zcf $BACKUPFILE app"
    tar -zcf $BACKUPFILE app
info 'backup web finished.'
cd $EXEC_DIR_NOW
