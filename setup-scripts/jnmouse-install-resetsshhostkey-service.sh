#!/bin/bash

# This file is based on
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/scripts/jetson_install_resetsshhostkey_service.sh
# which is released under the MIT License.
#
# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
#
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/LICENSE.md

sudo -v

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo ' '
echo '> ${DIR} set to '${DIR}

sudo cp ${DIR}/src/resetsshhostkey.sh /etc/systemd/resetsshhostkey.sh
sudo cp ${DIR}/src/resetsshhostkey.service /etc/systemd/system/resetsshhostkey.service

echo ' '
echo '> Check /etc/systemd'
ls -l /etc/systemd | grep resetsshhostkey

echo ' '
echo '> Check /etc/systemd/system'
ls -l /etc/systemd/system | grep resetsshhostkey

echo ' '
echo "> Executing 'sudo systemctl enable resetsshhostkey'..."
sudo systemctl enable resetsshhostkey
sudo systemctl list-unit-files | grep enabled | grep resetsshhostkey

echo ' '
echo '> Check the current disk usage'
df