#!/bin/sh -x
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo cp ~/configs/interfaces_openstack-allinone /etc/network/interfaces
sudo cp ~/configs/hostname_openstack-allinone /etc/hostname
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
sudo mkdir -p /etc/neutron/services/neutron-fwaas/
~/bin/chef-init_openstack-allinone.sh
sudo pvcreate /dev/sdb
sudo vgcreate cinder-volumes /dev/sdb
sudo apt-get -y install openssh-server
sudo reboot
