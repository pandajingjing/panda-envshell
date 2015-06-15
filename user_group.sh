#!/bin/sh

source ./common.sh

info 'add user and group start.'
	groupadd $ENV_GROUP
	useradd -g $ENV_GROUP $ENV_USER
	passwd $ENV_USER
info "add user:$ENV_USER and group:$ENV_GROUP success."

