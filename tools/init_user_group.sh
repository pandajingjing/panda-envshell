#!/bin/sh

#check if env user and group exist or initialize them

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; /bin/pwd)
EXEC_DIR_ROOT=`/bin/readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'check if env user and group exist or initialize them.'
/bin/grep -P "^$ENV_GROUP:" /etc/group > /dev/null
if [ $? -ne 0 ]
then
    info 'group '"$ENV_GROUP"' does not exist, create it.'
    /usr/sbin/groupadd "$ENV_GROUP"
else
    warn 'group '"$ENV_GROUP"' exist, keep it alive.'
fi

/bin/grep -P "^$ENV_USER:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
    ENV_PASS=`/bin/cat /proc/sys/kernel/random/uuid`
    info 'user '"$ENV_USER"' does not exist, create it.its pwd is '"$ENV_PASS"'.'
    /usr/sbin/useradd -g "$ENV_GROUP" -p "$ENV_PASS" "$ENV_USER"
else
    warn 'user '"$ENV_USER"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

info 'for safty reason, we do not allowed '"$ENV_USER"' to login.'
/usr/sbin/usermod -L "$ENV_USER"

/bin/grep -P "^$DEPLOY_USER:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
    ENV_PASS=`/bin/cat /proc/sys/kernel/random/uuid`
    info 'user '"$DEPLOY_USER"' does not exist, create it.its pwd is '"$ENV_PASS"'.'
    /usr/sbin/useradd -g "$ENV_GROUP" -p "$ENV_PASS" "$DEPLOY_USER"
else
    warn 'user '"$DEPLOY_USER"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

info 'add our operator.'
    read -t 10 -p "please input operator's name:" OPR_NAME
    if [ 'x' = "$OPR_NAME"'x' ];then
        info 'you can add our operator later.'
    else
        /bin/grep -P "^$OPR_NAME:" /etc/passwd > /dev/null
        if [ $? -ne 0 ]
        then
            /usr/sbin/useradd -g "$ENV_GROUP" "$OPR_NAME"
            /usr/bin/passwd $OPR_NAME
        else
            warn 'user '"$OPR_NAME"' exist.'
        fi
    fi
info 'our operator is ready.'

info 'env user and group are ready.'