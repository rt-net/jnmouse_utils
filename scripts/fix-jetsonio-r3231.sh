#!/bin/bash -eu

sudo find /opt/nvidia/jetson-io/ -mindepth 1 -maxdepth 1 -type d -exec touch {}/__init__.py \;
sudo mkdir -p /boot/dtb
ls /boot/*.dtb | xargs -I{} sudo ln -s {} /boot/dtb/
