#!/bin/bash

###
# Minimal configuration required to bootstrap a new machine
###

sudo dnf install -y git
sudo dnf install -y ansible

if [ ! -e ~/.ssh/id_rsa_github ]; then
    echo "No github SSH key found"
    ssh-keygen -f ~/.ssh/id_rsa_github -N ""
    echo "Copy this into Github:"
    cat ~/.ssh/id_rsa_github.pub
    echo "Press a key to continue..."
    read -n 1 -s
fi

if [ ! -e ~/.ssh/config ]; then
    echo "Creating SSH config"
    cat << EOF > ~/.ssh/config
Host github.com
    IdentityFile ~/.ssh/id_rsa_github
EOF
fi

mkdir -p ~/Projects

cd ~/Projects

git clone git@github.com:yoink00/dotfiles_devops.git

