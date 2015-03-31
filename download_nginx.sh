#!/bin/sh

source ./config.sh
nginx_tar_url="http://nginx.org/download/nginx-$nginx_version.tar.gz"

if [ ! -d $tar_folder ]; then
  mkdir $tar_folder
fi

cd $tar_folder

wget -c $nginx_tar_url

cd ../
