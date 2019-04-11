#!/bin/bash

#do some install scripts

showInfo 'apt install dhcp start.'
    /usr/bin/apt-get install isc-dhcp-server -y
showInfo 'apt install dhcp successfully.'