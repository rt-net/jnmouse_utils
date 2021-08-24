#!/bin/bash

# This file is based on
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/scripts/jetson_install_nvresizefs_service.sh
# which is released under the MIT License.
#
# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
#
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/LICENSE.md

sudo -v

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo ' '
echo '> ${DIR} set to '${DIR}

sudo cp ${DIR}/src/nvresizefs.sh /etc/systemd/nvresizefs.sh
sudo cp ${DIR}/src/system/nvresizefs.service /etc/systemd/system/nvresizefs.service

echo ' '
echo '> Check /etc/systemd'
ls -l /etc/systemd | grep nvresizefs

echo ' '
echo '> Check /etc/systemd/system'
ls -l /etc/systemd/system | grep nvresizefs

echo ' '
echo "> Executing 'sudo systemctl enable nvresizefs'..."
sudo systemctl enable nvresizefs
sudo systemctl list-unit-files | grep enabled | grep nvresizefs

echo ' '
echo '> Check the current disk usage'
df