#!/bin/bash -x
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo cp ~/configs/interfaces_openstack-allinone /etc/network/interfaces
sudo cp ~/configs/hostname_openstack-allinone /etc/hostname
sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
echo 'export LANG=C.UTF-8 LC_ALL=C.UTF-8' >> ~/.bashrc
sudo mkdir -p /etc/neutron/services/neutron-fwaas/
~/bin/chef-init_openstack-allinone.sh
sudo pvcreate /dev/sdb
sudo vgcreate cinder-volumes /dev/sdb
sudo apt-get -y install openssh-server openvswitch-switch libmysqlclient-dev
sudo ovs-vsctl add-br br-pppoe
sudo ovs-vsctl add-port br-pppoe eth2
sudo reboot
