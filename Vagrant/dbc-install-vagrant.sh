#!/bin/bash
# -- 
# Install Vagrant
# --
## Check if installed
if command -v vagrant > /dev/null 2>&1; then
    echo "[info]: Vagrant already installed."
    exit
fi

## Ubuntu 
if [[ $(lsb_release --id | grep -o "Ubuntu" | wc -l) -eq 1 ]]; then
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    sudo apt install vagrant -y
fi

