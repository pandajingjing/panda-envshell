#!/bin/bash

#ntp date and time

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/../`

source $sExecRootDir'/inc/initial.sh'

findPackageInstalled 'ntpdate'

if [ 0 -eq $? ];then
    showInfo 'we will install ntpdate for time sync.'
    installPackage 'ntpdate'
    if [ 0 -eq $? ]; then
        showInfo 'ntpdate is installed.'
    else
        showError 'ntpdate install failed.'
    fi
fi

showInfo 'start time sync...'

aNtpServers='
s1a.time.edu.cn
s1b.time.edu.cn
s1c.time.edu.cn
s1d.time.edu.cn
s1e.time.edu.cn
s2a.time.edu.cn
s2b.time.edu.cn
s2c.time.edu.cn
s2d.time.edu.cn
s2e.time.edu.cn
s2f.time.edu.cn
s2g.time.edu.cn
s2h.time.edu.cn
s2j.time.edu.cn
s2k.time.edu.cn
s2m.time.edu.cn'

for sServer in $aNtpServers
do
    showDebug 'sync '"$sServer"'.'
    /usr/sbin/ntpdate "$sServer"
    if [ 0 -eq $? ]; then
        showInfo 'time sync is down.'
        break;
    fi
done