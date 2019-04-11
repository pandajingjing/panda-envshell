#!/bin/bash

#do some configure script

showInfo 'configure squid start.'
    createDir $sBinLogInstallDir
    /bin/chown -R $sEnvUser:$sEnvGroup $BIN_CACHE_DIR
    /bin/chown -R $sEnvUser:$sEnvGroup $BIN_COREDUMP_DIR
    configBin $sExecBinVersionAssembleDir/conf/squid.conf $sBinInstallDir/etc/squid.conf
    configBin $sExecBinVersionAssembleDir/conf/squid.acl.conf $sBinInstallDir/etc/squid.acl.conf
showInfo 'configure squid successfully.'
showInfo 'add squid service start.'
    configBin $sExecBinVersionAssembleDir/service/squid /etc/init.d/squid
    /sbin/chkconfig --add squid
    /sbin/chkconfig --level 3 squid on
    showInfo "`/sbin/chkconfig --list | /bin/grep squid`"
showInfo 'add squid service successfully.'
showInfo 'add squid logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/squid' '/etc/logrotate.d/squid'
showInfo 'add squid logrotate successfully.'