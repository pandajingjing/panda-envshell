#!/bin/bash

#do some install scripts

info 'apt install dhcp start.'
    /usr/bin/apt-get install isc-dhcp-server -y
info 'apt install dhcp successfully.'