#!/bin/bash -eu

sudo systemctl mask apt-daily.service
sudo systemctl mask apt-daily.timer
sudo systemctl mask apt-daily-upgrade.service
sudo systemctl mask apt-daily-upgrade.timer
for TARGET_FILE in $(grep -ril "Update-Package-Lists" /etc/apt/apt.conf.d/); do
    echo Rewriting $TARGET_FILE
    sudo sed -i -e 's/Update-Package-Lists "1"/Update-Package-Lists "0"/g' -e 's/Unattended-Upgrade "1"/Unattended-Upgrade "0"/g' $TARGET_FILE
done

