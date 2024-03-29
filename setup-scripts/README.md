[English](README.md) | [日本語](README.ja.md)

# setup-scripts

These are scripts for creating SD-card image from scrach for [Jetson Nano Mouse](https://rt-net.jp/products/jetson-nano-mouse/).  
After configuring the system using this setup scripts, you can get started prototyping AI projects and ROS.

## Setup

### Option 1

Download the image directly

This image uses about 25GB of storage, so using a 64GB microSD card is recommended.

1. Download the image and flash it using [balenaEtcher](https://www.balena.io/etcher/).
2. Insert the microSD card to the Jeson Nano and run the following command to get ready for developping.
    ```
    cd ~/jnmouse_utils/scripts
    ./configure-jetson.sh
    ./update-qspi.sh
    ```

* default user name: `jetson`
* default user password: `jetson`
* differences between each image: [CHANGELOG.md](./CHANGELOG.md)

| Platform | Board revision | JetPack Version | Download | MD5 Checksum | branch |
| -------- | -------------- | --------------- | -------- |------------- | ------ |
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v3.zip](https://drive.google.com/open?id=1-eIXdtrHD8VY3M7C0sCRKE9LNfNPd97h) | `fe63b3db371a8c732c8311252bd268f0` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v2.zip](https://drive.google.com/open?id=1eyRdJdVfh4DCkAF1h6J93id33Hyb0Blf) | `53cf9fea7a9748ca36a358ea8ee52c7d` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)
| Jetson Nano (4GB) | `B01` | 4.5.1 |  [jnmouse_jp451_v1.zip](https://drive.google.com/open?id=1txWe7OSPzoAymprqKH0puZkG0RpUIWVL) | `6628fbec144e81b47490be3940276371` | [`release/jetpack-4.5.1`](https://github.com/rt-net/jnmouse_utils/tree/release/jetpack-4.5.1)

NOTE: Checkout the [NVIDIA's JetPack EULA](https://docs.nvidia.com/jetson/jetpack/eula/) and [License For Customer Use of NVIDIA Software](https://www.nvidia.com/en-us/drivers/nvidia-license/) before installation.

### Option 2

Create the SD-card image from scrach

1. Flash the official image to the microSD card following the [Official Document](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write)
2. Mount the microSD card to the PC and rename `usr/lib/nvidia/qspi-update/nvqspi-update.sh` to `usr/lib/nvidia/qspi-update/nvqspi-update.sh.bak`.
3. Remove the microSD card from the PC and insert it to the Jetson Nano.
4. Run the following setup scripts after the the OEM installation step.
    ```
    git clone https://github.com/rt-net/jnmouse_utils
    cd ~/jnmouse_utils/setup-scripts
    ./run-script-and-save-log.sh
    ```
5. Reboot the Jeson Nano and run the following command to get ready for developping.
    ```
    cd ~/jnmouse_utils/scripts
    ./configure-jetson.sh
    ./update-qspi.sh
    ```


## References

* https://github.com/NVIDIA-AI-IOT/jetbot
* https://github.com/NVIDIA-AI-IOT/jetcard
* https://docs.nvidia.com/jetson/l4t/index.html#page/Tegra%20Linux%20Driver%20Package%20Development%20Guide/bootflow_jetson_nano.html#wwconnect_header
