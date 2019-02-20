#!/bin/sh

#check if env user and group exist or initialize them

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'check if env user and group exist or initialize them.'
grep -P "^$ENV_GROUP:" /etc/group > /dev/null
if [ $? -ne 0 ]
then
	info 'group '"$ENV_GROUP"' does not exist, create it.'
	groupadd "$ENV_GROUP"
else
	warn 'group '"$ENV_GROUP"' exist, keep it alive.'
fi

grep -P "^$ENV_USER:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
	ENV_PASS=`cat /proc/sys/kernel/random/uuid`
	info 'user '"$ENV_USER"' does not exist, create it.its pwd is '"$ENV_PASS"'.'
	useradd -g "$ENV_GROUP" -p "$ENV_PASS" "$ENV_USER"
else
	warn 'user '"$ENV_USER"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

info 'for safty reason, we do not allowed '"$ENV_USER"' to login.'
usermod -L "$ENV_USER"

grep -P "^$DEPLOY_USER:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
	ENV_PASS=`cat /proc/sys/kernel/random/uuid`
	info 'user '"$DEPLOY_USER"' does not exist, create it.its pwd is '"$ENV_PASS"'.'
	useradd -g "$ENV_GROUP" -p "$ENV_PASS" "$DEPLOY_USER"
else
	warn 'user '"$DEPLOY_USER"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

info 'env user and group are ready.'