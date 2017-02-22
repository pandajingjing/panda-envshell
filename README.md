# panda-envshell

当前最新版本 V4.6.3

最初写这个的目的是为了能够在不同的机器上快速的安装出一套web运行环境,现在重写了整个代码结构,从而实现能够通过添加少量的配置和对应的脚本,从而实现安装和配置各类应用.

目前程序可以创建环境用户,安装一些系统需要的基本库,优化一些已有应用的配置,各类软件源码或编译文件的下载,安装,应用本身的配置以及相关其他引用的配置,并把应用的启动,重启和停止等加入服务列表.

##文件及对应功能

文件名|功能
----|----
config|整个框架的配置文件
configure.sh|根据模板和配置文件,配置具体的某个版本的应用
download.sh|下载对应的源码包或者是编译文件的包
extract.sh|解压缩下载好的文件包
install.sh|调用对应的安装脚本进行软件安装
test.sh|加载所有配置文件并输出所有配置变量和值
tools/init_common_lib.sh|安装系统需要或者增强体验所需要的基本库
tools/init_user_group.sh|创建环境运行所需要的用户和用户组
tools/ntpdate.sh|由于使用虚拟机,所以增加了ntp同步时间的脚本
tools/back_db_web.sh|物理备份数据库和web目录的文件
assemble|所有应用的配置文件,安装脚本,配置脚本等
inc|通用文件,包括函数和脚本初始化文件等
tar|下载的tar包存放在这里
temp|解压缩出来的文件放在这里,还有一些其他临时文件

所有的编辑,安装及配置需要的模板和参数,都在assemble对应的文件夹中,目前添加的都是我自己需要的内容,如果你有自己的需要,可以增加内容或者修改对应的文件.

##使用过程介绍
- 所有命令基于CentOS6.*版本,对于编译安装的应用,应该影响不大,对于下载编译好的应用,请注意系统环境,下载对应的版本.如果使用CentOS7,那就不要用这些程序了,自己重写吧╮(╯▽╰)╭
- 请使用root用户运行,且程序所在目录可写(用于下载tar包)
- 0.运行tools/nptdate.sh,与国内的ntp服务器同步本地时间
- 1.找到assemble里面对应应用和版本,就能查看具体的配置和脚本,如果没什么特别需求,就不要改了吧.另外文件中配置了相关的目录结构.
 - /data ``#应用根目录``
 - /data/bin ``#程序文件安装目录``
 - /data/logs ``#相关日志目录``
 - /data/app ``#web代码存放目录``
 - /data/share ``#samba匿名共享目录``
- 2.运行tools/init_user_group.sh,创建环境用户和用户组,密码随意,不会用
- 3.运行tools/init_common_lib.sh,安装运行本系统需要的和增强个人体验的基本库
- 4.运行test.sh,检查你安装的软件的各项配置是否符合你的需要
- 5.运行download.sh,下载你所需要的tar包
- 6.运行extract.sh,解压缩你所需要的tar包
- 7.运行install.sh安装你所需要的应用,安装程序会自动安装程序,并且根据配置和模板完成应用的配置

可以根据你自己的需要安装不同的应用,安装前都运行一下test.sh,确认配置符合你的要求.在后续的维护中,我会尽量把应用都做到可以通过service来控制,比如开机自动启动,重启应用,平滑加载配置等.

注意:
- 修改配置文件的时候注意修改一些可能涉及到安全的配置,比如sshd和mysql的端口号
- 配置sshd之前,请务必将自己的key上传至服务器对应的地方,因为配置完成后root就不能登陆,而其他帐号也无法通过账户密码的方式登陆了

##关于作者

```php
date_default_timezone_set('Asia/Shanghai');

class me extends 码畜
{

    public $_sNickName = 'pandajingjing';

    public $_sWebSite = 'http://www.jxu.life';

    protected $_iQQ = 18073848;
}
```

##change log
- 20170222 V4.6.3
 - 1.增加redis 3.2.8的部分
- 20170221 V4.6.2
 - 1.把curl编译到php内核中
- 20170204 V4.6.1
 - 1.调整了创建目录的权限
 - 2.调整了samba共享目录的权限
 - 3.调整了mysql安装过程
 - 4.增加了bind安装过程中的openssl-devel
- 20161125 V4.6
 - 1.新增一个备份脚本
- 20161105 V4.5.1
 - 1.新增mysql 5.7.16 i686的部分
- 20161009 V4.4.3
 - 1.新增nginx 1.11.4的部分
 - 2.在公用库中新增epel-release
 - 3.调整nginx关于local和其他域名的配置文件顺序
- 20161007 V4.3
 - 1.新增php7的部分
 - 2.调整了nginx中关于local子域名的配置
 - 3.在gitignore文件中添加了wget-log
- 20161005 V4.2
 - 1.新增squid代理服务
 - 2.修复了一些小bug
- 20160929 V4.1
 - 1.根据之前的框架结构,新增了samba共享服务
- 20160927 V4.0.1
 - 1.在休假期间,在甘南的一个小村庄,扎尕那,完成了4.0的所有应用配置
 - 2.现在一个基础的web应用环境已经全部完善了
 - 3.后面会慢慢根据自己的需要来增加应用和版本
- 20160210 V4.0
 - 1.终于在新年的加班里完成整个结构的重写
 - 2.通过assemble的结构能力支撑各类应用的安装,而不仅仅是满足于web引用了
 - 3.下面就是完善assemble里面的内容,以及debug了
- 20150808 V3.8.1
 - 1.调整里nginx中gzip的mimetype
- 20150709 V3.8
 - 1.修正了nginx中关于压缩js的一个配置问题
 - 2.加入了logrotate的nginx配置
- 20150702 V3.7.1
 - 1.增加了sshd的配置,快速修改成通过key登陆,并且阻止root和环境用户登陆
 - 2.增加了mysql的端口配置
 - 3.增加了bashrc的修改,对history的参数做了调整
 - 4.调整history目录到.history
- 20150616 V3.5.1
 - 1.调整了创建目录时候的相关逻辑
 - 2.修正了安装mysql时相对路径造成的一个bug
 - 3.整个程序结构基本就这么定了,以后就根据需要添加对应的*的部分程序了
- 20150615 V3.5
 - 1.重写了程序的结构
 - 2.将每个应用每个步骤的程序都单独了出来,方便直接运行
 - 3.增加了域名的配置
 - 4.修正了大部分的bug
- 20150611 V3.0
 - 1.重写了所有的程序
 - 2.增加了很多的可配置项
 - 3.又有新的想法了
- 20150604 V2.9
 - 1.加入BIND的安装支持
 - 2.打算重构了
- 20150603 V2.1
 - 1.将PHP版本从5.6.6调整为5.6.0
 - 2.创建目录时会创建php的日志目录
- 20150527 V2.0.1
 - 1.完善本文档 
- 20150526 V2.0
 - 1.添加了php-fpm的配置文件,配置为监听socket方式
 - 2.将nginx调用php-fp调整为socket方式
 - 3.取消pandajingjing.net域名的相关配置,仅跳转到jxu.life
 - 4.取消api域名的解析,增加service域名的解析
 - 5.添加chkconfig需要的程序,并可以通过命令将nginx,php,mysql服务化
- 20150415 V1.0.1
 - 1.修改了一下文档中的错别字啦
- 20150413 V1.0 
 - 1.写了这个文档,也算是初步的结构完成了,那就算1.0吧
 - 2.在创建日志目录的时候,顺带把nginx的子目录也创建了.nginx这丫不会自己创建日志目录
- 20150331 V0.9
 - 1.安装完nginx和php后导入相关站点配置,并检查配置,排除错误
 - 2.修改ignore文件,排除tar文件夹
 - 3.初始化所有项目文件
