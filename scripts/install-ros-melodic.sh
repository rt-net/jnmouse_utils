#!/bin/bash -eu

curl -SsfL https://raw.githubusercontent.com/Tiryoh/ros_setup_scripts_ubuntu/master/ros-melodic-ros-base-main.sh | bash
sudo apt-get install -y \
	ros-melodic-cv-bridge \
	ros-melodic-cv-camera \
	ros-melodic-gmapping \
	ros-melodic-hls-lfcd-lds-driver \
	ros-melodic-joint-state-publisher-gui \
	ros-melodic-joy \
	ros-melodic-map-server \
	ros-melodic-robot-state-publisher \
	ros-melodic-roslint \
	ros-melodic-rplidar-ros \
	ros-melodic-rt-usb-9axisimu-driver \
	ros-melodic-rviz \
	ros-melodic-teleop-twist-keyboard \
	ros-melodic-tf2-ros \
	ros-melodic-tf \
	ros-melodic-urg-node \
	ros-melodic-web-video-server
sed -i -e 's/export ROS_IP/# export ROS_IP/g' ~/.bashrc
sed -i -e 's/export ROS_MASTER_URI/# export ROS_MASTER_URI/g' ~/.bashrc
echo "export MYWLAN0IP=\$(ip a show wlan0 | grep global | sed -e 's/.*inet \([0-9\.]*\).*/\1/g')" >> ~/.bashrc
echo "export MYETH0IP=\$(ip a show eth0 | grep global | sed -e 's/.*inet \([0-9\.]*\).*/\1/g')" >> ~/.bashrc
echo "export ROS_IP=\$(echo \$MYWLAN0IP \$MYETH0IP 127.0.0.1 | cut -d' ' -f1)" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://\$ROS_IP:11311" >> ~/.bashrc
echo "Success installing ROS Melodic to Jetson Nano"
echo "Run 'source ~/.bashrc'"
