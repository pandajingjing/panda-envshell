#!/bin/bash

#do some configure script

showInfo 'configure bind start.'
    createDir "$sBinLogInstallDir"
    createDir "$sBinInstallDir"/etc/default
    createDir "$sBinInstallDir"/etc/mydomain

    $sBinInstallDir/sbin/rndc-confgen > $sBinInstallDir/etc/rndc.conf
    /usr/bin/tail -10 $sBinInstallDir/etc/rndc.conf | /usr/bin/head -9 | /bin/sed 's/#//g' > $sBinInstallDir/etc/named.conf
    /bin/echo "include \"$sBinInstallDir/etc/named.ext.conf\";" >> $sBinInstallDir/etc/named.conf

    configBin $sExecBinVersionAssembleDir/conf/named.ext.conf $sBinInstallDir/etc/named.ext.conf
    configBin $sExecBinVersionAssembleDir/conf/mydomain/zone.conf $sBinInstallDir/etc/mydomain/zone.conf
    configBin $sExecBinVersionAssembleDir/conf/mydomain/named.conf $sBinInstallDir/etc/mydomain/named.conf
    configBin $sExecBinVersionAssembleDir/conf/default/named.default.zone $sBinInstallDir/etc/default/named.default.zone
    configBin $sExecBinVersionAssembleDir/conf/default/named.empty $sBinInstallDir/etc/default/named.empty
    configBin $sExecBinVersionAssembleDir/conf/default/named.localhost $sBinInstallDir/etc/default/named.localhost
    configBin $sExecBinVersionAssembleDir/conf/default/named.loopback $sBinInstallDir/etc/default/named.loopback
    configBin $sExecBinVersionAssembleDir/conf/default/named.root $sBinInstallDir/etc/default/named.root

    $sBinInstallDir/sbin/named-checkconf $sBinInstallDir/etc/named.conf
    $sBinInstallDir/sbin/named-checkzone $BIN_DOMAIN $sBinInstallDir/etc/mydomain/zone.conf

showInfo 'configure bind successfully.'           
showInfo 'add bind service start.'
    configBin $sExecBinVersionAssembleDir'/service/bind' '/etc/init.d/bind'
    /sbin/chkconfig --add bind
    /sbin/chkconfig --level 3 bind on
    showInfo "`/sbin/chkconfig --list | /bin/grep bind`"
showInfo 'add bind service successfully.'
showInfo 'add bind logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/bind' '/etc/logrotate.d/bind'
showInfo 'add bind logrotate successfully.'