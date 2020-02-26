#main functions

#show some messages
function showMessage(){
    _sMessage=`/bin/date +"%Y-%m-%d %H:%M:%S"`'('"$1"'): '"$2"
    case $1 in
        error)
        /bin/echo -e "\033[31m$_sMessage\033[0m"
        ;;
        warn)
        /bin/echo -e "\033[33m$_sMessage\033[0m"
        ;;
        debug)
        /bin/echo -e "\033[37m$_sMessage\033[0m"
        ;;
        *)
        /bin/echo "$_sMessage"
        ;;
    esac
}

#show info message
function showInfo(){
    showMessage 'info' "$1"
}

#show warning message
function showWarning(){
    showMessage 'warn' "$1"
}

#show error message
function showError(){
    showMessage 'error' "$1"
    exit 1
}

#show debug message
function showDebug(){
    if [ $iDebug -eq 1 ]; then
        showMessage 'debug' "$1"
    elif [ $iDebug -eq 2 ]; then
        showMessage 'debug' "$1"
        read -t 10 -p 'press enter to continue...'
    fi
}

#show help we need
function showHelp() {
    /bin/echo 'Usage: '`basename $1`' -n appname [-v version]'
    /bin/echo `basename $1 .sh`' application in the newest or specific version'
    /bin/echo '  -n appname'
    /bin/echo '  -v specific version'
    /bin/echo '  -h show this help'
    exit 0
}

#create dir
function createDir(){
    showDebug 'create dir: '"$1"' start.'
    if [ -d $1 ]; then
        showDebug 'dir '"$1"' is exists.'
        if [ ! -z $2 ]; then
            showDebug "$1"' will be cleaned.'
            /bin/rm -rf "$1"
            /bin/mkdir -p "$1"
        fi
    else
        /bin/mkdir -p "$1"
    fi
    /bin/chown $sEnvUser:$sEnvGroup "$1"
    /bin/chmod 0775 "$1" -R
    showDebug 'create dir: '"$1"' successfully.'
}

function getOsArch(){
    ARCH_32='x32'
    ARCH_64='x64'
    if [ -f /bin/usr/uname ];then
        _sArchIssue=`/bin/usr/uname -m | /usr/bin/tr A-Z a-z`
    else
        _sArchIssue=`/bin/uname -m | /usr/bin/tr A-Z a-z`
    fi
    if [ $_sArchIssue = 'x86_64' ];then
        sArch=$ARCH_64
    else
        sArch=$ARCH_32
    fi
}

function _findOsName(){
    _sOsIssue=$1
    if [ `/bin/echo $_sOsIssue | /bin/grep 'debian' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_DEBIAN
    elif [ `/bin/echo $_sOsIssue | /bin/grep 'ubuntu' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_UBUNTU
    elif [ `/bin/echo $_sOsIssue | /bin/grep 'centos' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_CENTOS
    elif [ `/bin/echo $_sOsIssue | /bin/grep 'red hat' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_CENTOS
    elif [ `/bin/echo $_sOsIssue | /bin/grep 'aliyun' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_ALIYUN
    elif [ `/bin/echo $_sOsIssue | /bin/grep 'opensuse' | /usr/bin/wc -l` -ge 1 ]; then
        sOsName=$OS_OPENSUSE
    fi
}

function getOsName(){
    OS_CENTOS='CentOS'
    OS_UBUNTU='Ubuntu'
    OS_DEBIAN='Debian'
    OS_ALIYUN='Aliyun'
    OS_OPENSUSE='openSUSE'
    OS_OTHER='other'
    
    sOsName=$OS_OTHER
    _sOsIssue=`/bin/cat /etc/issue | /usr/bin/tr A-Z a-z`
    _findOsName "$_sOsIssue"
    if [ $sOsName = $OS_OTHER ]; then
        showWarning 'Can not get os name from /etc/issue, try lsb_release.'
        _sOsIssue=`lsb_release -a 2>/dev/null`
        _findOsName "$_sOsIssue"
    fi
    if [ $sOsName = $OS_OTHER ]; then
        showWarning 'Can not get os name from lsb_release, try check specific files.'
        if [ -f '/etc/redhat-release' ]; then
            sOsName=$OS_CENTOS
        elif [ -f '/etc/debian_version' ]; then
            sOsName=$OS_DEBIAN
        else
            showError 'can not get os name.'
        fi
    fi
}

#parse what todo
function parseBin(){
    while getopts 'n:v:h' arg; do
        case $arg in
            v) sBinVersion=$OPTARG
                ;;
            n) sBinName=$OPTARG
                ;;
            h) showHelp $0
                ;;
            ?) showHelp $0
                ;;
        esac
    done
	
    showDebug 'app name we got was: '"$sBinName"'.'
    showDebug 'app version we got was: '"$sBinVersion"'.'

    if [ -z $sBinName ]; then
        showHelp $0
    fi

    sExecBinAssembleDir=$sExecAssembleDir'/'$sBinName
    showDebug 'app assemble dir is: '"$sExecBinAssembleDir"'.'
        	
    if [ -d $sExecBinAssembleDir ]; then
        if [ -z $sBinVersion ]; then
            sBinVersion=`/bin/ls -vr $sExecBinAssembleDir | /usr/bin/head -1`
            if [ -z $sBinVersion ]; then
                showError 'assemble('"$sBinName"') have no version file.'
            fi
            sExecBinVersionAssembleDir=$sExecBinAssembleDir'/'$sBinVersion
            showDebug 'versioned app assemble dir is: '"$sExecBinVersionAssembleDir"'.'
        else
            sExecBinVersionAssembleDir=$sExecBinAssembleDir'/'$sBinVersion
            showDebug 'versioned app assemble dir is: '"$sExecBinVersionAssembleDir"'.'
            if [ ! -d $sExecBinVersionAssembleDir ]; then
                showError 'assemble('"$sBinName"'), version('"$sBinVersion"') does not exist.'
            fi
        fi
    else
        showError 'assemble('"$sBinName"') does not exist.'
    fi
}

#load assemble file
function loadAssembleFile(){
    _iLoadFileCnt=0;
    sExecBinVersionAssembleFile=$sExecBinVersionAssembleDir'/'$1
    if [ -f $sExecBinVersionAssembleFile ];then
        showDebug 'load assemble '"$1"' file: '"$sExecBinVersionAssembleFile"'.'
        source $sExecBinVersionAssembleFile
        ((_iLoadFileCnt++))
    fi
    sExecBinVersionAssembleOsFile=$sExecBinVersionAssembleFile'.'$sOsName
    if [ -f $sExecBinVersionAssembleOsFile ];then
        showDebug 'load assemble '"$1"' file: '"$sExecBinVersionAssembleOsFile"'.'
        source $sExecBinVersionAssembleOsFile
        ((_iLoadFileCnt++))
    fi
    sExecBinVersionAssembleOsArchFile=$sExecBinVersionAssembleOsFile'.'$sArch
    if [ -f $sExecBinVersionAssembleOsArchFile ];then
        showDebug 'load assemble '"$1"' file: '"$sExecBinVersionAssembleOsArchFile"'.'
        source $sExecBinVersionAssembleOsArchFile
        ((_iLoadFileCnt++))
    fi
    if [ 0 -eq $_iLoadFileCnt ]; then
        showError 'we miss any type of '"$1"' file.'
    fi
}

#configure app from its template with frame var
#configBin $sExecBinVersionAssembleDir'/conf/bashrc' '/etc/bashrc' '#custom bashrc start from here:' '#custom bashrc end here.'
function configBin(){
    showInfo 'configure '"$2"' start.'
    _sTemplateFile=$1
    _sDestFile=$2
    _sStartComment=$3
    _sEndComment=$4
    _sBackupFile=$_sDestFile'.'`/bin/date +%Y%m%d%H%M%S`
    if [ ! -f $_sTemplateFile ]; then
        showError 'we miss template file: '"$_sTemplateFile"'.'
    fi
    if [ ! -f $_sDestFile ];then
        /bin/touch $_sDestFile
    fi
    /bin/cp -f "$_sDestFile" "$_sBackupFile"

    if [ ! -z "$_sStartComment" ] && [ ! -z "$_sEndComment" ]; then
        iCommentStartLine=`/bin/grep -n "$_sStartComment" $_sDestFile | /usr/bin/awk -F ':' '{print $1}'`
        iCommentEndLine=`/bin/grep -n "$_sEndComment" $_sDestFile | /usr/bin/awk -F ':' '{print $1}'`
        iTotalLine=`/usr/bin/wc -l $_sDestFile | /usr/bin/awk '{print $1}'`

        showDebug 'we find where to start: '"$iCommentStartLine"'.'
        showDebug 'we find where to end: '"$iCommentEndLine"'.'
        showDebug 'total line number of old configuration file: '"$iTotalLine"'.'

        if [ -z $iCommentStartLine ]; then
            iCommentStartLine=0
        fi

        if [ -z $iCommentEndLine ]; then
            iCommentEndLine=0
        fi

        if [ -z $iTotalLine ]; then
            iTotalLine=0
        fi

        showDebug 'iCommentStartLine: '"$iCommentStartLine"'.'
        showDebug 'iCommentEndLine: '"$iCommentEndLine"'.'
        showDebug 'iTotalLine: '"$iTotalLine"'.'

        sErrorMessage='can not parse '"$_sDestFile"', file may modified manually.'

        if [ 0 -eq $iCommentStartLine ];then
            if [ 0 -lt $iCommentEndLine ];then
                showError "$sErrorMessage"
            fi
        else
            if [ $iCommentStartLine -gt $iCommentEndLine ] || [ $iCommentStartLine -eq $iCommentEndLine ];then
                showError "$sErrorMessage"
            fi
        fi

        if [ 0 -eq $iCommentStartLine ];then
            /bin/echo $_sStartComment >> $_sDestFile
            /bin/cat $_sTemplateFile >> $_sDestFile
            /bin/echo >> $_sDestFile
            /bin/echo $_sEndComment >> $_sDestFile
        else
            /usr/bin/head -n $[$iCommentStartLine-1] $_sBackupFile > $_sDestFile
            /bin/echo $_sStartComment >> $_sDestFile
            /bin/cat $_sTemplateFile >> $_sDestFile
            /bin/echo >> $_sDestFile
            /bin/echo $_sEndComment >> $_sDestFile
            /usr/bin/tail -n $[$iTotalLine-$iCommentEndLine] $_sBackupFile >> $_sDestFile
        fi
    else
        if [ -f $_sTemplateFile ];then
            /bin/cp -f -p "$_sTemplateFile" "$_sDestFile"
        fi
    fi

    for sExecConfigName in $sBinConfigFrameVars
    do
        eval sExecConfigValue="\$$sExecConfigName"
        _sExecConfigScript='s#{{'$sExecConfigName'}}#'$sExecConfigValue'#g'
        /bin/sed -i "$_sExecConfigScript" "$_sDestFile"
    done

    for sExecConfigName in $sBinConfigVars
    do
        eval sExecConfigValue="\$$sExecConfigName"
        _sExecConfigScript='s#{{'$sExecConfigName'}}#'$sExecConfigValue'#g'
        /bin/sed -i "$_sExecConfigScript" "$_sDestFile"
    done
    showInfo 'configure '"$_sDestFile"' success.'
}

function findPackageInstalled(){
    _sPackage=$1
    if [ $sOsName = $OS_UBUNTU ]; then
        _iIsInstalled=`/usr/bin/dpkg --get-selections | /bin/grep "$_sPackage" | /usr/bin/wc -l`
    elif [ $sOsName = $OS_CENTOS ]; then
        _iIsInstalled=`/bin/rpm -qa | /bin/grep "$_sPackage" | /usr/bin/wc -l`
    fi
    return $_iIsInstalled
}

function installPackage(){
    _sPackage=$1
    if [ $sOsName = $OS_UBUNTU ]; then
        /usr/bin/apt-get install $_sPackage -y
    elif [ $sOsName = $OS_CENTOS ]; then
        /usr/bin/yum install $_sPackage -y
    fi
    return $?
}

function updateAllPackage(){
    if [ $sOsName = $OS_UBUNTU ]; then
        /usr/bin/apt-get upgrade -y
        /usr/bin/apt autoremove -y
    elif [ $sOsName = $OS_CENTOS ]; then
        /usr/bin/yum update -y
        /usr/bin/yum autoremove -y
    fi
    return $?
}

function clearLogrotated(){
    showInfo 'clear logrotated.d start.'
    /bin/rm /etc/logrotate.d/*.*
    showInfo 'clear logrotated.d is finished.'
}