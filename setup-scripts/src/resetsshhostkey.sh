#!/bin/bash

# This is a script to resize partition and filesystem on the root partition
# This will consume all un-allocated sapce on SD card after boot.

# This file is based on
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/scripts/archive/nvresizefs.sh
# which is released under the MIT License.
#
# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
#
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/LICENSE.md


set -e

function cleanup()
{
	# Delete nvresizefs.sh, nvresizefs.service and its symlink
	rm "/etc/systemd/resetsshhostkey.sh"
	rm "/etc/systemd/system/resetsshhostkey.service"
	rm "/etc/systemd/system/multi-user.target.wants/resetsshhostkey.service"
}

rm -v /etc/ssh/ssh_host_*key*
dpkg-reconfigure openssh-server

# Clean up
cleanup