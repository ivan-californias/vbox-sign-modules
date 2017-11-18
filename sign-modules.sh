#!/bin/bash

if [ ! -f "keys/MOK.priv" ]; then
	echo "Can't find keys, run first './create-key.sh'"
	exit 1
fi

echo "Signing VirtualBox kernel modules"

for module in `ls /lib/modules/$(uname -r)/misc/vbox*`; do
       echo "Signing module: $module"
       sudo /usr/src/kernels/$(uname -r)/scripts/sign-file sha256 "keys/MOK.priv" "keys/MOK.der" $module
       echo "Adding module $(basename $module | sed 's/.ko$//')..."
       sudo modprobe $(basename $module | sed 's/.ko$//')
done

