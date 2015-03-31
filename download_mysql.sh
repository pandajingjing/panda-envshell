#!/bin/sh

source ./config.sh
mysql_tar_url="http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-$mysql_version-linux-glibc2.5-x86_64.tar.gz"

if [ ! -d $tar_folder ]; then
  mkdir $tar_folder
fi

cd $tar_folder

wget -c $mysql_tar_url

cd ../
