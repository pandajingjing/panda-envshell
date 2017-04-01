#!/bin/sh

#check if env user and group exist or initialize them

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'check if env user and group exist or initialize them.'
grep -P "^$ENV_GROUP:" /etc/group > /dev/null
if [ $? -ne 0 ]
then
	info 'group '$ENV_GROUP' does not exist, create it.'
	groupadd $ENV_GROUP
else
	warn 'group '$ENV_GROUP' exist, keep it alive.'
fi

grep -P "^$ENV_USER:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
	info 'user '$ENV_USER' does not exist, create it.its pwd is '$ENV_USER' too.'
	useradd -g $ENV_GROUP -p $ENV_USER $ENV_USER
else
	warn "user $ENV_USER exist, keep it alive, and never mind it's pwd, we dont need it."
fi

info "for safty reason, we do not allowed $ENV_USER to login."
usermod -L $ENV_USER

info 'env user and group are ready.'
