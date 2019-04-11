#!/bin/bash

#do some configure script

showInfo 'configure samba start.'
    createDir $sBinLogInstallDir
    createDir $BIN_SHARE_PATH
    /bin/chmod -R 0777 $BIN_SHARE_PATH
    /bin/chown -R nobody:nobody $BIN_SHARE_PATH
    configBin $sExecBinVersionAssembleDir'/conf/smb.conf' '/etc/samba/smb.conf'
showInfo 'configure samba successfully.'
showInfo 'mod samba service start.'
    /sbin/chkconfig --level 3 smb on
    showInfo "`/sbin/chkconfig --list | /bin/grep smb`"
showInfo 'mod samba service successfully.'
showInfo 'add samba logrotate start.'
    configBin $sExecBinVersionAssembleDir'/logrotate/smb' '/etc/logrotate.d/smb'
showInfo 'add samba logrotate successfully.'