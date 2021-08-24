#!/bin/bash -eu

# ref: https://github.com/NVIDIA-AI-IOT/jetbot/blob/v0.4.3/scripts/configure_jetson.sh

# Disable ZRAM
sudo systemctl disable nvzramconfig.service

# Default to Max-N power mode
sudo nvpmodel -m 0
