#!/bin/sh

source ./common.sh

info 'make directroy start.'
	for n in $DIR_VAR
	do
		eval i=\$$n
		make_dir $i
	done
info 'make directory success.'
