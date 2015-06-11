#!/bin/sh

source ./common.sh

info 'install common library start.'

yum install -y gcc make mlocate lrzsz openssh-clients autoconf ntpdate rsync pcre-devel openssl-devel libxml2-devel mysql-devel curl-devel wget libmcrypt-devel git epel-release libaio

info 'install common library success.'
