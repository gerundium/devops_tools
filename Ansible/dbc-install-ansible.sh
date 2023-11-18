#!/bin/bash
# -- 
# Install Ansible
# https://adamtheautomator.com/install-ansible/
# --
## Check if installed
if command -v ansible > /dev/null 2>&1; then
    echo "[info]: Ansible installed."
    exit
fi

## Ubuntu 
if [[ $(lsb_release --id | grep -o "Ubuntu" | wc -l) -eq 1 ]]; then
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt update
    sudo apt install software-properties-common ansible -y
fi

