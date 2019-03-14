#!/bin/bash

#do some install scripts

info 'yum install samba start.'
    /usr/bin/yum install samba samba-client -y
info 'yum install samba successfully.'