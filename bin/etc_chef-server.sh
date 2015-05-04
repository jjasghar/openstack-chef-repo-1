#!/bin/bash -x
sudo cp ~/configs/interfaces_chef-server /etc/network/interfaces
sudo cp ~/configs/hostname_chef-server /etc/hostname
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
echo 'export LANG=C.UTF-8 LC_ALL=C.UTF-8' >> ~/.bashrc
sudo apt-get -y update
sudo apt-get -y install openssh-server
sudo reboot
