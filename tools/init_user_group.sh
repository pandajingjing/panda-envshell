#!/bin/bash

#check if env user and group exist or initialize them

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/../`

source $sExecRootDir'/inc/initial.sh'

showInfo 'check if env user and group exist or initialize them.'
/bin/grep -P "^$sEnvGroup:" /etc/group > /dev/null
if [ $? -ne 0 ]
then
    showInfo 'group '"$sEnvGroup"' does not exist, create it.'
    /usr/sbin/groupadd "$sEnvGroup"
else
    showWarning 'group '"$sEnvGroup"' exist, keep it alive.'
fi

/bin/grep -P "^$sEnvUser:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
    sEnvPassword=`/bin/cat /proc/sys/kernel/random/uuid`
    showInfo 'user '"$sEnvUser"' does not exist, create it.its pwd is '"$sEnvPassword"'.'
    /usr/sbin/useradd -g "$sEnvGroup" -p "$sEnvPassword" "$sEnvUser"
else
    showWarning 'user '"$sEnvUser"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

showInfo 'for safty reason, we do not allowed '"$sEnvUser"' to login.'
/usr/sbin/usermod -L "$sEnvUser"

/bin/grep -P "^$sDeployUser:" /etc/passwd > /dev/null
if [ $? -ne 0 ]
then
    sEnvPassword=`/bin/cat /proc/sys/kernel/random/uuid`
    showInfo 'user '"$sDeployUser"' does not exist, create it.its pwd is '"$sEnvPassword"'.'
    /usr/sbin/useradd -m -g "$sEnvGroup" -p "$sEnvPassword" "$sDeployUser"
else
    showWarning 'user '"$sDeployUser"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

showInfo 'add our operator.'
    read -t 10 -p "please input operator's name:" OPR_NAME
    if [ 'x' = "$OPR_NAME"'x' ];then
        showInfo 'you can add our operator later.'
    else
        /bin/grep -P "^$OPR_NAME:" /etc/passwd > /dev/null
        if [ $? -ne 0 ]
        then
            /usr/sbin/useradd -g "$sEnvGroup" "$OPR_NAME"
            /usr/bin/passwd $OPR_NAME
        else
            showWarning 'user '"$OPR_NAME"' exist.'
        fi
    fi
showInfo 'our operator is ready.'

showInfo 'env user and group are ready.'