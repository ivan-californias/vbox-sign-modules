#!/bin/bash

if [ ! -f "keys/MOK.priv" ]; then
	echo "Creating new key..."
	mkdir -p keys
	openssl req -new -x509 -newkey rsa:2048 -keyout "keys/MOK.priv" -outform DER -out "keys/MOK.der" -nodes -days 36500 -subj "/CN=$(whoami)/"
else
	echo "A key already exists"
fi

if mokutil --test-key "keys/MOK.der"; then
	echo "Importing key with mokutil..."
	sudo mokutil --import keys/MOK.der
	echo "You must reboot the system to complete key enrollment"
else
	echo "Key is already enrolled"
fi


