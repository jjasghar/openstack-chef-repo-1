#!/bin/sh -x
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
~/bin/chef-init_openstack-allinone.sh
