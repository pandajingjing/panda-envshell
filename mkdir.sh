#!/bin/sh

source ./config.sh

#mkdir data_dir
if [ -d $data_dir ]; then
  echo "$data_dir already exists."
  exit
else
  mkdir $data_dir
  chown app:app $data_dir -R
  chmod 0755 $data_dir -R
fi
#data_dir made

#mkdir bin_dir
if [ -d $bin_dir ]; then
  echo "$bin_dir already exists."
  exit
else
  mkdir $bin_dir
  chown app:app $bin_dir -R
  chmod 0755 $bin_dir -R
fi
#bin_dir made

#mkdir log_dir
if [ -d $log_dir ]; then
  echo "$log_dir already exists."
  exit
else
  mkdir $log_dir
  chown app:app $log_dir -R
  chmod 0755 $log_dir -R
  mkdir $log_dir/nginx
fi
#log_dir made

#mkdir app_dir
if [ -d $app_dir ]; then
  echo "$app_dir already exists."
  exit
else
  mkdir $app_dir
  chown app:app $app_dir -R
  chmod 0755 $app_dir -R
fi
#app_dir made
