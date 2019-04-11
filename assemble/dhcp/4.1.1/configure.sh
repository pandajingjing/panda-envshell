#!/bin/bash

#do some configure script

showInfo 'configure dhcpd start.'
    createDir $sBinLogInstallDir
    configBin $sExecBinVersionAssembleDir'/conf/dhcpd.conf' '/etc/dhcp/dhcpd.conf'
    configBin $sExecBinVersionAssembleDir'/conf/rsyslog.conf' '/etc/rsyslog.conf' '#dhcpd log configuration start from here:' '#dhcpd log configuration end here.'
showInfo 'configure dhcpd successfully.'
showInfo 'mod dhcpd service start.'
    /sbin/chkconfig --level 3 dhcpd on
    showInfo "`/sbin/chkconfig --list | /bin/grep dhcpd`"
showInfo 'mod dhcpd service successfully.'
showInfo 'add dhcpd logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/dhcpd' '/etc/logrotate.d/dhcpd'
showInfo 'add dhcpd logrotate successfully.'