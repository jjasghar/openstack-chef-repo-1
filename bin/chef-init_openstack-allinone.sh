#!/bin/bash -x
sudo rm -r /etc/chef
sudo mkdir -p /etc/chef
sudo cp ~/configs/encrypted_data_bag_secret /etc/chef/openstack_data_bag_secret

