#!/bin/bash

#extract what you need

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/`

source $sExecRootDir'/inc/initial.sh'

parseBin "$@"

showInfo 'extract '"$sBinName"'('"$sBinVersion"') start.'

loadAssembleFile 'config'

createDir "$sExecTempDir"

if [ -z $sBinCodeTar ];then
    showError 'sBinCodeTar is empty, we need it to find app source code tar.'
fi
if [ -z $sBinSourceCodeSubDir ];then
    showError 'sBinSourceCodeSubDir is empty, we need it to put app source code.'
fi
sExecBinCodeDir=$sExecTempDir$sBinSourceCodeSubDir
sExecBinCodeTarFile=$sExecTarDir'/'$sBinCodeTar
showDebug 'extracted source code dir is: '"$sExecBinCodeDir"'.'
if [ -d $sExecBinCodeDir ];then
    showDebug 'source code dir is exists. clear it.'
    /bin/rm $sExecBinCodeDir -rf
fi

if [ -f $sExecBinCodeTarFile ];then
    showInfo 'extract source code: '"$sExecBinCodeTarFile"' start.'
    sFileExt="${sExecBinCodeTarFile##*.}"
    case $sFileExt in
    'tar')
         /bin/tar -zxf "$sExecBinCodeTarFile" -C "$sExecTempDir"
    ;;
    'gz')
        /bin/tar -zxf "$sExecBinCodeTarFile" -C "$sExecTempDir"
    ;;
    'tgz')
        /bin/tar -zxf "$sExecBinCodeTarFile" -C "$sExecTempDir"
    ;;
    'xz')
        /bin/tar -xf "$sExecBinCodeTarFile" -C "$sExecTempDir"
    ;;
    'zip')
        /usr/bin/unzip "$sExecBinCodeTarFile" -d "$sExecTempDir"
    ;;
    *)
        showError 'unknown file type.'
    ;;
    esac
    if [ 0 -eq $? ];then
        showInfo 'extract source code: '"$sExecBinCodeTarFile"' successfully.'
    else
        showError 'extract source code: '"$sExecBinCodeTarFile"' failed.'
    fi
else
    showError 'we miss '"$sExecBinCodeTarFile"', try to download it.'
fi