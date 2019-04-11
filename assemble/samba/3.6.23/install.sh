#!/bin/bash

#do some install scripts

showInfo 'apt install samba start.'
    /usr/bin/apt-get install samba samba-client -y
showInfo 'apt install samba successfully.'