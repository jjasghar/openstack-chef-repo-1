#!/bin/sh
sudo cp ~/configs/interfaces_chef-server /etc/network/interfaces
sudo cp ~/configs/hostname_chef-server /etc/hostname
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo reboot
