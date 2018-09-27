#!/bin/bash

###
# Minimal configuration required to bootstrap a new machine
###

sudo apt install git
sudo apt install ansible

if [ ! -e ~/.ssh/id_rsa_github ]; then
    echo "No github SSH key found"
    ssh-keygen -f ~/.ssh/id_rsa_github -N ""
    echo "Copy this into Github:"
    cat ~/.ssh/id_rsa_github.pub
fi

if [ ! -e ~/.ssh/config ]; then
    echo "Creating SSH config"
    cat << EOF > ~/.ssh/config
Host github.com
    IdentityFile ~/.ssh/id_rsa_github
EOF
fi

