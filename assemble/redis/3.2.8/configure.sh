#!/bin/bash

#do some configure script

showInfo 'configure redis start.'
    createDir $sBinLogInstallDir
    configBin $sExecBinVersionAssembleDir'/conf/redis.conf' $sBinInstallDir'/redis.conf'
showInfo 'configure redis successfully.'	
showInfo 'add redis service start.'
    configBin $sExecBinVersionAssembleDir'/service/redis' '/etc/init.d/redis'
    /sbin/chkconfig --add redis
    /sbin/chkconfig --level 3 redis on
    showInfo "`/sbin/chkconfig --list | /bin/grep redis`"
showInfo 'add redis service successfully.'
showInfo 'add redis logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/redis' '/etc/logrotate.d/redis'
showInfo 'add redis logrotate successfully.'