# panda-envshell

当前最新版本 V8.0

最初写这个的目的是为了能够在不同的机器上快速的安装出一套 web 运行环境, 现在重写了整个代码结构, 从而实现能够通过添加少量的配置和对应的脚本, 从而实现安装和配置各类应用.

目前程序可以创建环境用户, 安装一些系统需要的基本库, 优化一些已有应用的配置, 各类软件源码或编译文件的下载, 安装, 应用本身的配置以及相关其他引用的配置, 并把应用的启动, 重启和停止等加入服务列表.

## 文件及对应功能

文件名|功能
----|----
config|整个脚本的配置文件
configure.sh|根据模板和配置文件, 配置具体的某个版本的应用
download.sh|下载对应的源码包或者是编译文件的包
extract.sh|解压缩下载好的文件包
install.sh|调用对应的安装脚本进行软件安装
test.sh|加载所有配置文件并输出所有配置变量和值
tools/init\_user\_group.sh|创建环境运行所需要的用户和用户组
tools/ntpdate.sh|由于使用虚拟机, 所以增加了 ntp 同步时间的脚本
assemble|所有应用的配置文件, 安装脚本, 配置脚本等
inc|通用文件, 包括函数和脚本初始化文件等
tar|下载的 tar 包存放在这里
temp|解压缩出来的文件放在这里, 还有一些其他临时文件

所有的编辑, 安装及配置需要的模板和参数, 都在 assemble 对应的文件夹中, 目前添加的都是我自己需要的内容, 如果你有自己的需要, 可以增加内容或者修改对应的文件.

## 使用过程介绍
- 所有命令支持Ubuntu 15, CentOS 7及以上版本.
- 请使用 root 用户运行, 且程序所在目录可写(用于下载 tar 包).
- 0.基本准备工作.
	- 安装git.
	- 运行 git clone https://github.com/pandajingjing/panda-envshell.git 获取本代码.
- 1.检查相关配置.
	- 检查 ./config 文件,查看env\_user, env\_group 作为运行环境的用户名和用户组, sDeployUser 作为部署环境的用户名.
	- 确认相关环境目录.
	- 找到 assemble 里面对应应用和版本, 就能查看具体的配置和脚本, 如果没什么特别需求, 就不要改了吧.
- 2.运行 tools/nptdate.sh, 与国内的 ntp 服务器同步本地时间.
- 3.运行 tools/init_user_group.sh, 创建环境用户和用户组, 密码随意, 不会用.
- 4.运行 test.sh, 检查你安装的软件的各项配置是否符合你的需要.
- 5.运行 download.sh, 下载你所需要的 tar 包.
- 6.运行 extract.sh, 解压缩你所需要的 tar 包.
- 7.运行 install.sh 安装你所需要的应用, 安装程序会自动编译和安装程序.
- 8.运行 configure.sh 配置你的应用.
- 9.系统会根据情况启动你的应用.

可以根据你自己的需要安装不同的应用, 安装前都运行一下 test.sh, 确认配置符合你的要求. 在后续的维护中, 我会尽量把应用都做到可以通过 systemctl 来控制, 比如开机自动启动, 重启应用, 平滑加载配置等.

注意:

- 修改配置文件的时候注意修改一些可能涉及到安全的配置, 例如:
	- ssh中的主机名, ip, 端口.
	- squid中的端口号, acl.
	- redis中的主机名, ip, 端口, 密码.
	- memcached中的ip, 端口.
- 配置 sshd 之前, 请务必将自己的 pub key 上传至服务器对应的地方, 因为配置完成后 root 就不能登陆, 而其他帐号也无法通过账户密码的方式登陆了.

看代码的朋友, 这里有份[注释](variable.md), 希望能帮到你.

## 关于作者

```php
date_default_timezone_set('Asia/Shanghai');

class me extends 码畜
{

    public $_sNickName = 'pandajingjing';

    public $_sWebSite = 'http://www.jxulife.com';

    protected $_iQQ = 18073848;
}
```

## change log
- 20190403 V8.0
    - 1.全面支持Ubuntu 15及CentOS 7
    - 2.支持32位及64位机器
    - 3.增加函数执行返回值检查以及错误判定
    - 4.assemble 中的相关修改还未全部完成, 待完成
- 20190402 V7.1
    - 1.Ubuntu相关修改
    - 2.双系统统一的修改
    - 3.尽快安排双系统合并的修改
    - 4.增加 showError 退出的状态码
- 20190329 V6.2.2
    - 1.根据yum安装结果修改自定义安装的相关配置
    - 2.尽快升级到CentOS 7以上版本
- 20190328 V7.0
    - 1.往 Ubuntu 上迁移
    - 2.优化 sshd 配置
- 20190319 V6.2
    - 1.全部使用/bin/bash
- 20190313 V6.1.1
	- 1.系统命令都使用绝对路径
	- 2.创建系统用户时, 可以创建普通用户
- 20190201 V6.0
	- 1.除根目录下的几个可执行文件权限调整为755外, 其他文件调整为644
	- 2.针对现有云主机环境, 区分 fix-data 与 dynamic-data, 即本地磁盘和云磁盘
	- 3.对变量使用单引号及双引号的检查
	- 4.删除业务代码的发布功能, 专注于运维环境维护
	- 5.修复 configBin 被非首次调用时修改文件的错误
	- 6.修改bash历史记录存储位置, 并增加 ip 及 mac 地址为文件名的一部分
	- 7.增加 vim-enhanced 公用包
	- 8.针对现有前后端分离的场景,增强静态文件管理的支持
	- 9.补全各类应用的 logrotate
	- 10.增加对 app 与系统有联系的功能的配置
	- 11.增加 ssh 隧道功能
	- 12.增加部署账号
- 20190131 V5.3
	- 1.增加 dhcp 服务的功能
- 20190125 V5.2.5
	- 1.微调 php 编译的扩展内容
- 20181129 V5.2.4
	- 1.bashrc 的部分调整到 profile
- 20181014 V5.2.3
	- 1.微调 php 和 mysql 的安装及运行命令
	- 2.增加 php 和 mysql 的版本支持
	- 3.回归了所有的命令, 删除了一些较老的版本
	- 4.统一了 socket 的存放位置, 增加了 php 的默认时区配置
	- 5.增加 app 用户密码的强度
	- 6.修复了 mysql 安装过程中的一些问题
- 20180508 V5.1
	- 1.增加 ZeroMQ 4.2.3
- 20180119 V5.0
	- 1.增加发布代码的功能
	- 2.增加静态资源文件按照内容 hash 发布的功能
- 20171202 V4.8.8
	- 1.对静态资源添加头信息:Access-Control-Allow-Origin
- 20170629 V4.8.7
	- 1.修改 nginx 域名正则模板变量名错误
- 20170526 V4.8.6
	- 1.memcached 只监听本地请求
	- 2.redis 只监听本地请求
	- 3.app 目录结构中目录分隔符使用-
- 20170401 V4.8.5
	- 1.添加环境用户时不再需要人工输入密码
	- 2.安装 php 是增加 openssl-devel 库
	- 3.为 nginx 增加 server_names_hash_bucket_size 配置
	- 4.完善本文档
	- 5.修正 redis 配置文件中 ip 的错误
- 20170223 V4.8
	- 1.增加 memcached 1.4.34的部分
- 20170222 V4.7
	- 1.增加 redis 3.2.8的部分
- 20170221 V4.6.2
	- 1.把 curl 编译到 php 内核中
- 20170204 V4.6.1
	- 1.调整了创建目录的权限
	- 2.调整了 samba 共享目录的权限
	- 3.调整了 mysql 安装过程
	- 4.增加了 bind 安装过程中的 openssl-devel
- 20161125 V4.6
	- 1.新增一个备份脚本
- 20161105 V4.5.1
	- 1.新增 mysql 5.7.16 i686 的部分
- 20161009 V4.4.3
	- 1.新增 nginx 1.11.4的部分
	- 2.在公用库中新增 epel-release
	- 3.调整 nginx 关于 local 和其他域名的配置文件顺序
- 20161007 V4.3
	- 1.新增 php7 的部分
	- 2.调整了 nginx 中关于 local 子域名的配置
	- 3.在 gitignore 文件中添加了 wget-log
- 20161005 V4.2
	- 1.新增 squid 代理服务
	- 2.修复了一些小 bug
- 20160929 V4.1
	- 1.根据之前的框架结构 ,新增了 samba 共享服务
- 20160927 V4.0.1
	- 1.在休假期间, 在甘南的一个小村庄, 扎尕那, 完成了4.0的所有应用配置
	- 2.现在一个基础的 web 应用环境已经全部完善了
	- 3.后面会慢慢根据自己的需要来增加应用和版本
- 20160210 V4.0
	- 1.终于在新年的加班里完成整个结构的重写
	- 2.通过 assemble 的结构能力支撑各类应用的安装, 而不仅仅是满足于 web 应用了
	- 3.下面就是完善 assemble 里面的内容, 以及 debug 了
- 20150808 V3.8.1
	- 1.调整里 nginx 中 gzip 的 mimetype
- 20150709 V3.8
 	- 1.修正了 nginx 中关于压缩 js 的一个配置问题
	- 2.加入了 logrotate 的 nginx 配置
- 20150702 V3.7.1
	- 1.增加了 sshd 的配置, 快速修改成通过 key 登陆, 并且阻止 root 和环境用户登陆
	- 2.增加了 mysql 的端口配置
	- 3.增加了 bashrc 的修改, 对 history 的参数做了调整
	- 4.调整 history 目录到 .history
- 20150616 V3.5.1
	- 1.调整了创建目录时候的相关逻辑
	- 2.修正了安装 mysql 时相对路径造成的一个 bug
	- 3.整个程序结构基本就这么定了, 以后就根据需要添加对应的*的部分程序了
- 20150615 V3.5
	- 1.重写了程序的结构
	- 2.将每个应用每个步骤的程序都单独了出来, 方便直接运行
	- 3.增加了域名的配置
	- 4.修正了大部分的 bug
- 20150611 V3.0
	- 1.重写了所有的程序
	- 2.增加了很多的可配置项
	- 3.又有新的想法了
- 20150604 V2.9
	- 1.加入 bind 的安装支持
	- 2.打算重构了
- 20150603 V2.1
	- 1.将PHP版本从 5.6.6 调整为 5.6.0
	- 2.创建目录时会创建php的日志目录
- 20150527 V2.0.1
	- 1.完善本文档 
- 20150526 V2.0
	- 1.添加了 php-fpm 的配置文件, 配置为监听 socket 方式
	- 2.将 nginx 调用 php-fpm 调整为 socket 方式
	- 3.取消 pandajingjing.net 域名的相关配置, 仅跳转到 jxu.life
	- 4.取消 api 域名的解析, 增加 service 域名的解析
	- 5.添加 chkconfig 需要的程序, 并可以通过命令将 nginx, php, mysql 服务化
- 20150415 V1.0.1
	- 1.修改了一下文档中的错别字啦
- 20150413 V1.0 
	- 1.写了这个文档, 也算是初步的结构完成了, 那就算1.0吧
	- 2.在创建日志目录的时候, 顺带把 nginx 的子目录也创建了, nginx 这丫不会自己创建日志目录
- 20150331 V0.9
	- 1.安装完 nginx 和 php 后导入相关站点配置, 并检查配置, 排除错误
	- 2.修改 ignore 文件, 排除 tar 文件夹
	- 3.初始化所有项目文件