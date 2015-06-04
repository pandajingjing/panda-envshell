#!/bin/sh

source ./config.sh
bind_tar_url="ftp://ftp.isc.org/isc/bind9/9.10.2/bind-$bind_version.tar.gz"

if [ ! -d $tar_folder ]; then
  mkdir $tar_folder
fi

cd $tar_folder

wget -c $bind_tar_url

cd ../
