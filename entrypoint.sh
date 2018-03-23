#!/bin/bash

if [ -f ssh_key ]; then
	/ssh-chat -i /ssh_key $@
else
	echo "SSH Key not found at /ssh_key. Generating..."
	apt-get update > /dev/null && apt-get install openssh-client -y > /dev/null 2>&1
	ssh-keygen -t rsa -b 4096 -f /ssh_key -q -N ''
	/ssh-chat -i /ssh_key $@
fi
