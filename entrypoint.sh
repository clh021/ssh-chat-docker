#!/bin/bash

if [ -f ssh_key ]; then
	/ssh-chat -i /ssh_key $@
else
	echo "SSH Key not found at /ssh_key. Generating..."
	ssh-keygen -t rsa -b 4096 -f /ssh_key -q -N ''
	/ssh-chat -i /ssh_key $@
fi
