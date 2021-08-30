#!/bin/bash

# Copyright 2021 RT Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This program is based on https://github.com/dusty-nv/ros_deep_learning.
# which is released under the MIT License.
# 
# Copyright (c) 2019, NVIDIA CORPORATION. All rights reserved.
# 
# https://github.com/NVIDIA-AI-IOT/jetcard/blob/852475be56ab220283b273f7c320e74b764a3b43/install.sh
 

set -e

password='jetson'

# Record the time this script starts
date

# Get the full dir name of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo $DIR

# Keep updating the existing sudo time stamp
sudo -v
while true; do sudo -n true; sleep 120; kill -0 "$$" || exit; done 2>/dev/null &

# Make swapfile
echo -e "\e[46m Make swapfile \e[0m"
cd
if [ ! -f /var/swapfile ]; then
    sudo fallocate -l 6G /var/swapfile
    sudo chmod 600 /var/swapfile
    sudo mkswap /var/swapfile
    sudo swapon /var/swapfile
    sudo bash -c 'echo "/var/swapfile swap swap defaults 0 0" >> /etc/fstab'
else
    echo "Swapfile already exists"
fi

# Disable auto upgrade
cd $DIR/../
pwd
bash ./scripts/disable-auto-apt-upgrade.sh

# Install pip and some python dependencies
echo -e "\e[104m Install pip and some python dependencies \e[0m"
sudo apt-get update
sudo apt-get install -y python3-pip python3-setuptools python3-pil python3-smbus python3-matplotlib cmake curl
sudo -H pip3 install --upgrade pip

# Install python gst dependencies
sudo apt-get install -y \
    libwayland-egl1 \
    gstreamer1.0-plugins-bad \
    libgstreamer-plugins-bad1.0-0 \
    gstreamer1.0-plugins-good \
    python3-gst-1.0

# Install jtop
echo -e "\e[100m Install jtop \e[0m"
sudo -H pip3 install jetson-stats 

# ============================================
# Install jnm_jupyternotebook and Jupyter Lab
# ============================================

# Install the pre-built TensorFlow pip wheel
echo -e "\e[48;5;202m Install the pre-built TensorFlow pip wheel \e[0m"
sudo apt-get install -y libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran

sudo -H pip3 install -U pip testresources setuptools==49.6.0 
sudo -H pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 h5py==2.10.0 keras_preprocessing==1.1.1 keras_applications==1.0.8 gast==0.2.2 futures protobuf pybind11
sudo -H pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45  'tensorflow<2'

mkdir -p $HOME/jnmouse_utils/workspace

# Install the pre-built PyTorch pip wheel 
echo -e "\e[45m Install the pre-built PyTorch pip wheel  \e[0m"
cd $HOME/jnmouse_utils/workspace
wget -N https://nvidia.box.com/shared/static/9eptse6jyly1ggt9axbja2yrmj6pbarc.whl -O torch-1.6.0-cp36-cp36m-linux_aarch64.whl 
sudo apt-get install -y python3-pip libopenblas-base libopenmpi-dev 
sudo -H pip3 install Cython
sudo -H pip3 install numpy==1.19.4 torch-1.6.0-cp36-cp36m-linux_aarch64.whl

# Install torchvision package
echo -e "\e[45m Install torchvision package \e[0m"
cd $HOME/jnmouse_utils/workspace
git clone https://github.com/pytorch/vision torchvision
cd torchvision
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
git checkout tags/v0.7.0
sudo -H python3 setup.py install
# sudo -H pip3 install pillow

# Install torch2trt
cd $HOME/jnmouse_utils/workspace
git clone https://github.com/NVIDIA-AI-IOT/torch2trt 
cd torch2trt 
sudo -H python3 setup.py install --plugins

# Install version of traitlets with dlink.link() feature
# (added after 4.3.3 and commits after the one below only support Python 3.7+) 
echo -e "\e[48;5;172m Install traitlets \e[0m"
#sudo -H python3 -m pip install git+https://github.com/ipython/traitlets@master
sudo -H python3 -m pip install git+https://github.com/ipython/traitlets@dead2b8cdde5913572254cf6dc70b5a6065b86f8

# Install JupyterLab (lock to 2.2.6, latest as of Sept 2020)
echo -e "\e[48;5;172m Install Jupyter Lab 2.2.6 \e[0m"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs libffi-dev libssl-dev 
# Requires jedi==0.17.2 for Python 3.6 + iPython 7.x to avoid tab completion error
# https://github.com/ipython/ipython/issues/12748
sudo -H pip3 install jupyter jupyterlab==2.2.6 jedi==0.17.2 --verbose
sudo -H jupyter labextension install @jupyter-widgets/jupyterlab-manager

jupyter lab --generate-config
python3 -c "from notebook.auth.security import set_password; set_password('$password', '$HOME/.jupyter/jupyter_notebook_config.json')"

# Install bokeh
sudo -H pip3 install bokeh
sudo -H jupyter labextension install @bokeh/jupyter_bokeh

# Install jupyter_clickable_image_widget
echo -e "\e[42m Install jupyter_clickable_image_widget \e[0m"
cd $HOME/jnmouse_utils/workspace
git clone https://github.com/jaybdub/jupyter_clickable_image_widget
cd jupyter_clickable_image_widget
git checkout tags/v0.1
sudo -H pip3 install -e .
sudo -H jupyter labextension install js
sudo -H jupyter lab clean
sudo chown -R jetson:jetson ~/.local/share
sudo chown -R jetson:jetson /usr/local/share/jupyter
jupyter lab build

# Install jnm_jupyternotebook
sudo apt-get install -y python3-smbus
cd $HOME
git clone https://github.com/rt-net/jnm_jupyternotebook
cd jnm_jupyternotebook
sudo python3 setup.py install
mkdir -p $HOME/Notebooks
./scripts/copy_notebook.sh

# Install jupyter service
echo -e "\e[44m Install jupyter service \e[0m"
cd $HOME/jnm_jupyternotebook/jnmouse/utils
python3 create_jupyter_service.py --working_directory="$HOME/Notebooks/"
sudo mv jnmouse_jupyter.service /etc/systemd/system/jnmouse_jupyter.service
sudo systemctl enable jnmouse_jupyter
sudo systemctl start jnmouse_jupyter

if ! (grep -q "/usr/local/cuda/bin" $HOME/.bashrc);then
    echo "export PATH=\${PATH}:/usr/local/cuda/bin" >> $HOME/.bashrc
fi
if ! (grep -q "/usr/local/cuda/lib64" $HOME/.bashrc);then
    echo "export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:/usr/local/cuda/lib64" >> $HOME/.bashrc
fi

# ====================
# Install PyCUDA
# ====================
echo -e "\e[45m Install PyCUDA package \e[0m"
export PATH=${PATH}:/usr/local/cuda/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64

sudo apt-get install -y libboost-python-dev libboost-thread-dev
arch=$(uname -m)
boost_pylib=$(basename /usr/lib/${arch}-linux-gnu/libboost_python*-py3?.so)
boost_pylibname=${boost_pylib%.so}
boost_pyname=${boost_pylibname/lib/}

echo "** Download pycuda-2019.1.2 sources"
cd $HOME/jnmouse_utils/workspace
if [ ! -f pycuda-2019.1.2.tar.gz ]; then
  wget https://files.pythonhosted.org/packages/5e/3f/5658c38579b41866ba21ee1b5020b8225cec86fe717e4b1c5c972de0a33c/pycuda-2019.1.2.tar.gz
fi

echo "** Build and install pycuda-2019.1.2"
CPU_CORES=$(nproc)
echo "** cpu cores available: " $CPU_CORES
tar xzvf pycuda-2019.1.2.tar.gz
cd pycuda-2019.1.2
python3 ./configure.py --python-exe=/usr/bin/python3 --cuda-root=/usr/local/cuda --cudadrv-lib-dir=/usr/lib/${arch}-linux-gnu \
    --boost-inc-dir=/usr/include --boost-lib-dir=/usr/lib/${arch}-linux-gnu --boost-python-libname=${boost_pyname} \
    --boost-thread-libname=boost_thread --no-use-shipped-boost
make -j$CPU_CORES
python3 setup.py build
sudo python3 setup.py install
python3 -c "import pycuda; print('pycuda version:', pycuda.VERSION)"

# ====================
# Install ROS Melodic
# ====================
echo -e "\e[44m Install ROS Melodic \e[0m"
cd $DIR/../
pwd
bash ./scripts/install-ros-melodic.sh

# =================================
# Optimize the system configuration
# =================================
echo -e "\e[104m Install remaining dependencies for projects \e[0m"
# Update camera-overrides
cd $DIR/../
pwd
bash ./scripts/update-camera-overrides.sh

# Disable ZRAM
sudo systemctl disable nvzramconfig.service

# Default to Max-N power mode
sudo nvpmodel -m 0

# Restore nvspi-update.sh
if [ -f /usr/lib/nvidia/qspi-update/nvqspi-update.sh.bak ]; then
    sudo mv /usr/lib/nvidia/qspi-update/nvqspi-update.sh.bak /usr/lib/nvidia/qspi-update/nvqspi-update.sh
fi

# ============================
# Install JetsonNanoMouse
# ============================
cd $HOME
git clone https://github.com/rt-net/JetsonNanoMouse
cd JetsonNanoMouse
make build
sudo make install

# Install remaining dependencies for projects
echo -e "\e[104m Install remaining dependencies for projects \e[0m"
sudo apt-get install -y python-setuptools tmux

echo -e "\e[42m All done! \e[0m"

#record the time this script ends
date