#!/bin/bash

#configure what you need

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/`

source $sExecRootDir'/inc/initial.sh'

parseBin "$@"

showInfo 'configure '"$sBinName"'('"$sBinVersion"') start.'

loadAssembleFile 'config'

#start app configure script
sExecNowDir=`pwd`
loadAssembleFile 'configure'
cd $sExecNowDir

showInfo 'configure '"$sBinName"'('"$sBinVersion"') is finished.'