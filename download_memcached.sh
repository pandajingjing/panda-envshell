#!/bin/sh

source ./config.sh
memcached_tar_url="http://memcached.googlecode.com/files/memcached-$memcached_version.tar.gz"

if [ ! -d $tar_folder ]; then
  mkdir $tar_folder
fi

cd $tar_folder

wget -c $memcached_tar_url

cd ../
