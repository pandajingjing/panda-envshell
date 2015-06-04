#!/bin/sh

source ./config.sh
bind_tar_file_name="bind-$bind_version.tar.gz"
bind_dir="bind-$bind_version"

if [ ! -d $bin_dir ]; then
  echo 'Create dir first.'
  exit
fi

#install start
cd $tar_folder

#install bind
if [ -d $bind_dir ]; then
  rm -rf $bind_dir
fi

if [ -d $bin_dir/$bind_dir ]; then
  rm -rf $bin_dir/$bind_dir
fi

tar -zxf $bind_tar_file_name
cd $bind_dir

./configure "--prefix=$bin_dir/$bind_dir" --enable-largefile --enable-threads

make && make install

cd ../
#bind installed

cd ../
#install end

#configure and test
cp bind_conf/bind.conf "$bin_dir/$bind_dir"/conf
cp bind_conf/conf.d "$bin_dir/$bind_dir"/conf/ -R

"$bin_dir/$bind_dir"/sbin/bind -t
