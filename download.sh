#!/bin/bash

#download what you need

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/`

source $sExecRootDir'/inc/initial.sh'

parseBin "$@"

showInfo 'download '"$sBinName"'('"$sBinVersion"') start.'

loadAssembleFile 'config'

createDir "$sExecTarDir"

if [ -z $sBinDownloadUrl ];then
    showError 'sBinDownloadUrl is empty, we need it to get app source code tar.'
fi

showInfo 'download '"$sBinDownloadUrl"' start.'
/usr/bin/wget -P "$sExecTarDir" -c "$sBinDownloadUrl"
if [ 0 -eq $? ];then
    showInfo 'download '"$sBinDownloadUrl"' successfully.'
else
    showError 'download '"$sBinDownloadUrl"' failed.'
fi