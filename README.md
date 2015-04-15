# panda-envshell

这是一个快速安装nginx+php+mysql运行环境的脚本集合

通过脚本可以快速的完成环境的搭建.包括环境用户创建,目录创建,基本库安装,相关软件源码或编译文件的下载,相关软件的编译安装.

##文件及对应功能

文件名|功能
----|----
common_lib.sh|安装一些通用的库文件
config.sh|顾名思义,配置文件
download_*|会英文的都懂,下载对应的tar包
install_*|安装相关软件,其中nginx和php是源码编译安装,mysql是bin文件安装
mkdir.sh|创建相关的目录结构
user_group.sh|创建环境用户
nginx_conf|nginx的配置目录

当然了,相关的编译,安装及配置参数,都是根据自己的需求来做的,如果你有自己的需求,改改改

##使用过程介绍
- 所有命令基于CentOS6.*-x86_64版本,如果使用的是32位版本,请调整mysql的tar包下载路径.如果使用CentOS7,那就不要用这些脚本了,自己重写吧╮(╯▽╰)╭
- 请使用root用户运行,且脚本所在目录可写(用于下载tar包)
- 1.编辑config.sh,确认nginx(1.6.2),php(5.6.6),mysql(5.6.23)的版本(括弧中是默认的版本号),如果没什么特别需求,就不要改了吧.另外文件中配置了相关的目录结构.
 - /data ``#应用根目录``
 - /data/bin ``#程序文件安装目录``
 - /data/logs ``#相关日志目录``
 - /data/app ``#web代码存放目录``
- 2.运行user_group.sh,创建环境用户和用户组,密码随意
- 3.运行mkdir.sh,创建相关目录结构
- 4.运行common_lib.sh安装相关扩展库
- 5.运行download_*.sh下载你所需要的tar包
- 6.运行install_*.sh安装你所需要的应用

到此你的环境应该安装差不多了,php基本是不需要配置的,nginx就需要大家自己修改配置了,我的那份配置修改一下域名,就可以支持多分支开发,测试及正式环境的部署,虽然很low

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
