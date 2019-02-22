#!/bin/bash
suffix=1

while [ True ]
do
	if [[ -f ~/Sisop/password$suffix.txt ]]; then
		suffix=$((suffix + 1))
	else
		cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c12 > ~/Sisop/password$suffix.txt
		break
	fi
done