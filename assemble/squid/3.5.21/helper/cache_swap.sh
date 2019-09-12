#!/bin/bash
for adir in '{{sBinCacheDir}}'; do
    if [ ! -d $adir/00 ]; then
        echo -n "init_cache_dir $adir... "
        {{sBinInstallDir}}/sbin/squid -N -z -F -f {{sBinInstallDir}}/etc/squid.conf >> {{sBinLogInstallDir}}/squid.out 2>&1
    fi
done