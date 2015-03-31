#!/bin/sh

source ./config.sh
nginx_tar_file_name="nginx-$nginx_version.tar.gz"
nginx_dir="nginx-$nginx_version"

if [ ! -d $bin_dir ]; then
  echo 'Create dir first.'
  exit
fi

#install start
cd $tar_folder

#install nginx
if [ -d $nginx_dir ]; then
  rm -rf $nginx_dir
fi

if [ -d $bin_dir/$nginx_dir ]; then
  rm -rf $bin_dir/$nginx_dir
fi

tar -zxf $nginx_tar_file_name
cd $nginx_dir

./configure "--prefix=$bin_dir/$nginx_dir" --user=app --group=app --with-http_ssl_module --with-http_gzip_static_module  --with-http_stub_status_module --with-pcre

make && make install

cd ../
#nginx installed

cd ../
#install end
