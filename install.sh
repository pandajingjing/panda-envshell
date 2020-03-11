#!/bin/bash

#install what you need

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/`

source $sExecRootDir'/inc/initial.sh'

parseBin "$@"

showInfo 'install '"$sBinName"'('"$sBinVersion"') start.'

loadAssembleFile 'config'

#empty bin dir
if [ -z $sBinInstallDir ];then
    read -t 5 -p 'sBinInstallDir is empty, ignore it? [y/N]:' sIgnoreError
    if [ 'yx' = "$sIgnoreError"'x' ];then
        showInfo 'we install app in custom scripts.'
    else
        showError 'sBinInstallDir is empty, we need it to put app bin file.'
    fi
else
    showInfo 'app installed dir is: '"$sBinInstallDir"'.'
    createDir $sBinInstallDir 'y'
fi

#install its basic lib
if [ ! -z "$sBinCommonLib" ]; then
    showInfo "we will install: '$sBinCommonLib' for your app installation."
    installPackage "$sBinCommonLib"
    if [ 0 -eq $? ];then
         showInfo 'app lib install successfully.'
    else
        showError 'app lib install failed.'
    fi
fi

#start app install script
sExecNowDir=`pwd`
showInfo 'run custom scripts start.'
    loadAssembleFile 'install'
showInfo 'run custom scripts is finished.'
cd $sExecNowDir

showInfo 'install '"$sBinName"'('"$sBinVersion"') is finished.'