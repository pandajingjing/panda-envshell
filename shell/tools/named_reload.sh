#!/bin/sh

{{INSTALL_DIR_BIN}}/{{BIN_BIND}}/sbin/named-checkconf {{INSTALL_DIR_BIN}}/{{BIN_BIND}}/etc/named.conf

{{INSTALL_DIR_BIN}}/{{BIN_BIND}}/sbin/named-checkzone {{INSTALL_DIR_BIN}}/{{BIN_BIND}}/etc/jxu/zone.conf jxu.life

{{INSTALL_DIR_BIN}}/{{BIN_BIND}}/sbin/rndc reload jxu.life
