#!/usr/bin/env bash
set -eu

# cd to temp directory
cd /tmp
TMPDIR=$(mktemp -d tmp.XXXXXXXXXX)
cd $TMPDIR

wget https://www.waveshare.com/w/upload/e/eb/Camera_overrides.tar.gz  -O - | tar -xz
sudo mv camera_overrides.isp /var/nvidia/nvcam/settings/
sudo chmod 664 /var/nvidia/nvcam/settings/camera_overrides.isp
sudo chown root:root /var/nvidia/nvcam/settings/camera_overrides.isp
