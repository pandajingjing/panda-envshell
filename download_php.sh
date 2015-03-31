#!/bin/sh

source ./config.sh
php_tar_url="http://cn2.php.net/distributions/php-$php_version.tar.gz"

if [ ! -d $tar_folder ]; then
  mkdir $tar_folder
fi

cd $tar_folder

wget -c $php_tar_url

cd ../
