source $EXEC_DIR_ROOT'/config'
source $EXEC_DIR_ROOT'/inc/functions.sh'

debug 'UID is:'$UID
if [ $UID -ne 0 ] ; then
	error 'You should run as root!!!'
fi

#app name and version
BIN_NAME=''
BIN_VERSION=''
BIN_FULL_NAME=''

#assemble dir of current version of current app
EXEC_DIR_ASSEMBLE_BIN_VERSION=''