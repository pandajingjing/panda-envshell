#!/bin/sh

source ./config.sh
mysql_tar_file_name="mysql-$mysql_version-linux-glibc2.5-x86_64.tar.gz"
mysql_dir="mysql-$mysql_version-linux-glibc2.5-x86_64"
mysql_ln_dir='/usr/local/mysql'

if [ ! -d $bin_dir ]; then
  echo 'Create dir first.'
  exit
fi

#install start
cd $tar_folder

#install php
if [ -d $mysql_dir ]; then
  rm -rf $mysql_dir
fi

if [ -d $bin_dir/$mysql_dir ]; then
  rm -rf $bin_dir/$mysql_dir
fi

rm /etc/my.cnf -rf
rm $mysql_ln_dir -rf

tar -zxf $mysql_tar_file_name
cp $mysql_dir $bin_dir/$mysql_dir -R

ln -s $bin_dir/$mysql_dir $mysql_ln_dir

cd $mysql_ln_dir

scripts/mysql_install_db --user=app
bin/mysqld_safe --user=app &

echo 'input root password:'
read pwd

bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'%' identified by '$pwd'"
bin/mysql -h127.0.0.1 -uroot -e "grant all privileges on *.* to root@'localhost' identified by '$pwd'"

cd ~/shell
#mysql installed
#install end
