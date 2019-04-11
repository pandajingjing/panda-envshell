#!/bin/bash

#test all script configure and behaviour

sExecCurrentDir=$(cd "$(dirname "$0")"; /bin/pwd)
sExecRootDir=`/bin/readlink -f $sExecCurrentDir/`

source $sExecRootDir'/inc/initial.sh'

parseBin "$@"

showInfo 'test '"$sBinName"'('"$sBinVersion"') start.'

loadAssembleFile 'config'

showInfo 'show all frame variables start.'
    for sExecConfigName in $sBinConfigFrameVars
    do
        eval sExecConfigValue="\$$sExecConfigName"
        showMessage "$sExecConfigName" "$sExecConfigValue"
    done
showInfo 'show all frame variables successfully.'
showInfo 'show all custom variables start.'
    for sExecConfigName in $sBinConfigVars
    do
        eval sExecConfigValue="\$$sExecConfigName"
        showMessage "$sExecConfigName" "$sExecConfigValue"
    done
showInfo 'show all custom variables successfully.'

showInfo 'test '"$sBinName"'('"$sBinVersion"') successfully.'