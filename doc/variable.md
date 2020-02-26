## 自定义变量和自定义函数含义列表

### 自定义变量(根据执行过程中变量的出现先后排序)

变量名|文件|含义|默认值
----|----|----|----
sExecCurrentDir|/\*.sh|脚本运行时当前目录|sExecRootDir
sExecRootDir|/\*.sh|脚本运行时的根目录|sExecRootDir
----|----|----|----
sEnvUser|/config|环境运行所使用的用户名|app
sEnvGroup|/config|环境运行所使用的用户组|app
sDeployUser|/config|部署app或者网络环境时使用的用户名|deployer
iDebug|/config|脚本运行过程中的debug级别|1
sFixDataInstallDir|/config|固定数据安装目录|/fix-data
sDynamicDataInstallDir|/config|动态数据安装目录|/dynamic-data
sBinInstallRootDir|/config|系统应用安装根目录|/fix-data/bin
sLogInstallRootDir|/config|日志存放根目录|/dynamic-data/log
sAppInstallRootDir|/config|业务应用安装根目录|/fix-data/app
sExecTarDir|/config|脚本运行时存放tar文件的目录|\$sExecRootDir'/tar'
sExecTempDir|/config|脚本运行时存放临时文件的目录|\$sExecRootDir'/temp'
sExecAssembleDir|/config|脚本运行时加载对应应用文件的目录|\$sExecRootDir'/assemble'
----|----|----|----
OS\_CENTOS|/inc/functions.sh|CentOS操作系统|
OS\_UBUNTU|/inc/functions.sh|Ubuntu操作系统|
OS\_DEBIAN|/inc/functions.sh|Debian操作系统|
OS\_ALIYUN|/inc/functions.sh|Aliyun操作系统|
OS\_OPENSUSE|/inc/functions.sh|openSUSE操作系统|
OS\_OTHER|/inc/functions.sh|其他操作系统|
sOsName|/inc/functions.sh|操作系统名称|OS\_CENTOS, OS\_UBUNTU, OS\_DEBIAN, OS\_ALIYUN, OS\_OPENSUSE, OS\_OTHER
ARCH\_32|/inc/functions.sh|32位操作系统|
ARCH\_64|/inc/functions.sh|64位操作系统|
sArch|/inc/functions.sh|操作系统架构|ARCH\_32, ARCH\_64
----|----|----|----
sBinName|/inc/functions.sh|系统应用名称|运行参数, 必须
sBinVersion|/inc/functions.sh|系统应用版本|运行参数, 或最新版本
sExecBinAssembleDir|/inc/functions.sh|脚本运行时加载当前应用文件的目录|\$sExecAssembleDir'/'\$sBinName
sExecBinVersionAssembleDir|/inc/functions.sh|脚本运行时加载当前应用当前版本的目录|\$sExecBinAssembleDir'/'\$sBinVersion
sExecBinVersionAssembleFile|/inc/functions.sh|脚本运行时加载当前应用当前版本的文件|\$sExecBinVersionAssembleDir'/'\$1
sExecBinVersionAssembleOsFile|/inc/functions.sh|脚本运行时加载当前应用当前版本当前操作系统的文件|$sExecBinVersionAssembleFile'.'\$sOsName
sExecBinVersionAssembleOsArchFile|/inc/functions.sh|脚本运行时加载当前应用当前版本当前操作系统当前系统架构的文件|sExecBinVersionAssembleOsFile'.'\$sArch
----|----|----|----
sBinConfigFrameVars|/inc/initial.sh|脚本运行中使用的框架配置变量名|...
----|----|----|----
sBinFullName|/assemble/\*/\*/config|系统应用全称, 包含应用名与版本号|
sBinDownloadUrl|/assemble/\*/\*/config|系统应用(源码或程序包)下载路径|
sBinCodeTar|/assemble/\*/\*/config|下载后文件的名称|
sBinSourceCodeSubDir|/assemble/\*/\*/config|源代码在临时目录里的子文件夹|
sBinCommonLib|/assemble/\*/\*/config|系统应用依赖的库|
sBinInstallDir|/assemble/\*/\*/config|系统应用安装目录|/fix-data/bin/\*
sBinLogInstallDir|/assemble/\*/\*/config|系统应用日志存放目录|/dynamic-data/log/\*
sBinPidInstallFile|/assemble/\*/\*/config|系统应用pid文件存放位置|/fix-data/bin/\*/\*.pid
sBinConfigVars|/assemble/\*/\*/config|脚本运行中使用的系统应用配置变量名|
----|----|----|----
*|/assemble/\*/\*/config|其他需要的变量

### 自定义函数

函数名|含义|相关自定义变量(不含内部变量)
----|----|----
showMessage|显示带时间, 格式, 级别的信息|
showInfo|显示普通信息|
showWarning|显示警告信息|
showError|显示错误信息, 并退出, 返回状态码1|
showDebug|根据iDebug显示调试信息|
showHelp|显示脚本帮助信息|
createDir|递归创建目录, 如果已存在可清空|
parseBin|解析脚本的参数, 并设置相关变量|sBinName, sBinVersion, sExecBinAssembleDir, sExecBinVersionAssembleDir
getOsArch|获取操作系统架构|ARCH\_32, ARCH\_64, sArch
getOsName|获取操作系统名称|OS\_CENTOS, OS\_UBUNTU, OS\_DEBIAN, OS\_ALIYUN, OS\_OPENSUSE, OS\_OTHER, sOsName
loadAssembleFile|加载当前应用当前版本目录中的文件|sExecBinVersionAssembleFile, sExecBinVersionAssembleOsFile, sExecBinVersionAssembleOsArchFile
configBin|配置应用的配置文件|
findPackageInstalled|查找系统中是否安装了某个package|
installPackage|在系统中安装某个package|
updateAllPackage|更新系统中所有的package, 并删除没有被依赖的package|