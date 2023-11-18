#!/bin/bash
# -- 
# Install Vagrant
# https://vitux.com/how-to-install-virtualbox-on-ubuntu/
# --
## Check if installed
if command -v VBoxHeadless > /dev/null 2>&1; then
    echo "[info]: Virtualbox already installed."
    exit
fi

## Ubuntu 
if [[ $(lsb_release --id | grep -o "Ubuntu" | wc -l) -eq 1 ]]; then
    sudo add-apt-repository multiverse && sudo apt-get update
    sudo apt update
    sudo apt install virtualbox virtualbox-ext-pack -y
fi

