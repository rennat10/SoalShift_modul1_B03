#!/bin/bash

cat /var/log/syslog | awk ' /[cC][rR][oO][nN]/ && !/[sS][uU][dD][oO]/ {print $0;}' | awk 'NF < 13' >> ~/Sisop/Modul1/output.log
