#!/bin/sh

source ./config.sh
php_tar_file_name="php-$php_version.tar.gz"
php_dir="php-$php_version"

if [ ! -d $bin_dir ]; then
  echo 'Create dir first.'
  exit
fi

#install start
cd $tar_folder

#install php
if [ -d $php_dir ]; then
  rm -rf $php_dir
fi

if [ -d $bin_dir/$php_dir ]; then
  rm -rf $bin_dir/$php_dir
fi

tar -zxf $php_tar_file_name
cd $php_dir

./configure "--prefix=$bin_dir/$php_dir" --enable-fpm --with-fpm-user=app --with-fpm-group=app --disable-short-tags --disable-ipv6 --with-zlib --with-pdo-mysql --enable-mbstring --with-openssl --enable-zip --with-mcrypt

make && make install

cd ../
#php installed

cd ../
#install end

#configure and test
cp $php_dir/php.ini-development "$bin_dir/$php_dir"/lib/php.ini

cp "$bin_dir/$php_dir"/etc/php-fpm.conf.default "$bin_dir/$php_dir"/etc/php-fpm.conf

"$bin_dir/$php_dir"/sbin/php-fpm -t
