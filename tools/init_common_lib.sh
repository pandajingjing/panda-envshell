#!/bin/sh

#install all common lib for this scripts

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'install all common lib for this scripts or enhance your experience by using yum tools, lib for application will installed with procedure of its own.'

debug 'we will install: '"$COMMON_LIB"'.'

/usr/bin/yum install -y $COMMON_LIB
/usr/bin/yum update -y

info 'common lib for common works is down.'