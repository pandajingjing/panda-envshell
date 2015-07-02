#!/bin/sh

source ./common.sh

info 'configure bash start.'
	cat $EXEC_DIR_BINCONF/bash/bashrc >> /etc/bashrc
info 'configure bash success.'
