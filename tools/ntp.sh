#!/bin/sh

#ntp while it is done

EXEC_CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)
EXEC_DIR_ROOT=`readlink -f $EXEC_CURRENT_DIR/../`

source $EXEC_DIR_ROOT'/inc/initial.sh'

info 'we will install ntp for time sync.'

yum install -y -q ntp

info 'ntp is installed.'

info 'start time sync...'

NTP_SERVERS='
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

for SERVER in $NTP_SERVERS
do
    info 'sync '$SERVER
    ntpdate $SERVER
    if [ 0 -eq $? ];then
        info 'time sync is down.'
        break;
    fi
done
#info $?

