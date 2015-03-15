#!/bin/sh -x
sudo cp ~/configs/interfaces_openstack-allinone /etc/network/interfaces
sudo cp ~/configs/hostname_openstack-allinone /etc/hostname
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo apt-get -y install openssh-server
sudo reboot
