#!/bin/bash -eu

# ref: https://github.com/NVIDIA-AI-IOT/jetbot/blob/v0.4.3/scripts/configure_jetson.sh

# Re-generate SSH host key
if (ssh-keygen -lf /etc/ssh/ssh_host_rsa_key.pub | grep -q "SHA256:Iy7A+5mZ8Ka5uLqnW0/0jL0+59EEJfECff6iDXOP7DI" > /dev/null ); then
    sudo rm -v /etc/ssh/ssh_host_*key*
    sudo dpkg-reconfigure openssh-server
fi

# Disable ZRAM
sudo systemctl disable nvzramconfig.service

# Default to Max-N power mode
sudo nvpmodel -m 0
