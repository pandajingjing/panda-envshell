source $sExecRootDir'/inc/functions.sh'
source $sExecRootDir'/config'

showDebug 'UID is: '"$UID"'.'
if [ $UID -ne 0 ] ; then
    showError 'You should run as root!!!'
fi

getOsName
getOsArch

showDebug 'Os Name is: '"$sOsName"
showDebug 'Arch is: '"$sArch"

parseBin "$@"

#create base dir
createDir $sFixDataInstallDir
createDir $sDynamicDataInstallDir
createDir $sBinInstallRootDir
createDir $sLogInstallRootDir
createDir $sAppInstallRootDir

#create bin configure variables
sBinConfigFrameVars='sEnvUser sEnvGroup sDeployUser iDebug sFixDataInstallDir sDynamicDataInstallDir sBinInstallRootDir sLogInstallRootDir sAppInstallRootDir
sExecCurrentDir sExecRootDir sExecTarDir sExecTempDir sExecAssembleDir
sOsName sArch
sBinName sBinVersion sExecBinAssembleDir sExecBinVersionAssembleDir sExecBinVersionAssembleFile sExecBinVersionAssembleOsFile sExecBinVersionAssembleOsArchFile'