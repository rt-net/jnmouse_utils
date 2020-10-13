#!/bin/bash -eu

curl -SsfL https://raw.githubusercontent.com/Tiryoh/ros_setup_scripts_ubuntu/master/ros-melodic-ros-base-main.sh | bash
sudo apt-get install \
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
	ros-melodic-urg-node
	ros-melodic-web-video-server
echo "Success installing ROS Melodic to Jetson Nano"
echo "Run 'source ~/.bashrc'"
