#!/bin/bash

#install all common lib for this scripts

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; /bin/pwd)
EXEC_DIR_ROOT=`/bin/readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'install all common lib for this scripts or enhance your experience by using apt tools, lib for application will installed with procedure of its own.'

debug 'we will install: '"$COMMON_LIB"'.'

/usr/bin/apt-get install $COMMON_LIB -y
/usr/bin/apt-get upgrade -y

info 'common lib for common works is down.'