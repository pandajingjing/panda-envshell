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
    /usr/sbin/useradd -m -s '/bin/bash' -g "$sEnvGroup" -p "$sEnvPassword" "$sEnvUser"
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
    /usr/sbin/useradd -m -s '/bin/bash' -g "$sEnvGroup" -p "$sEnvPassword" "$sDeployUser"
else
    showWarning 'user '"$sDeployUser"' exist, keep it alive, and never mind its pwd, we dont need it.'
fi

showInfo 'add our operator.'
    read -t 10 -p "please input operator's name:" sOprName
    if [ 'x' = "$sOprName"'x' ];then
        showInfo 'you can add our operator later.'
    else
        /bin/grep -P "^$sOprName:" /etc/passwd > /dev/null
        if [ $? -ne 0 ]; then
            read -t 10 -p "want your own password? or we create a system password.[y/N]" sCustomPwd
            if [ 'yx' = "$sCustomPwd"'x' ];then
                /usr/sbin/useradd -m -s '/bin/bash' -g "$sEnvGroup" "$sOprName"
                /usr/bin/passwd $sOprName
            else
                sEnvPassword=`/bin/cat /proc/sys/kernel/random/uuid`
                /usr/sbin/useradd -m -s '/bin/bash' -g "$sEnvGroup" -p "$sEnvPassword" "$sOprName"
            fi
        else
            showWarning 'user '"$sOprName"' exist.'
        fi
    fi
showInfo 'our operator is ready.'

showInfo 'env user and group are ready.'