#!/bin/bash

#do some configure script

showInfo 'configure memcached start.'
    createDir $sBinLogInstallDir
showInfo 'configure memcached successfully.'	
showInfo 'add memcached service start.'
    configBin $sExecBinVersionAssembleDir'/service/memcached' '/etc/init.d/memcached'
    /sbin/chkconfig --add memcached
    /sbin/chkconfig --level 3 memcached on
    showInfo "`/sbin/chkconfig --list | /bin/grep memcached`"
showInfo 'add memcached service successfully.'
showInfo 'add memcached logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/memcached' '/etc/logrotate.d/memcached'
showInfo 'add memcached logrotate successfully.'