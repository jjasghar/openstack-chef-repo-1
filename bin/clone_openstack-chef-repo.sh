#!/bin/bash -x
cd ~/git
rm -rf openstack-chef-repo
git clone https://github.com/stackforge/openstack-chef-repo 
cd openstack-chef-repo
mv data_bags data_bags.bak
ln -s ~/configs/data_bags .
mv infrastructure.yml infrastructure.yml.bak
ln -s ~/configs/infrastructure.yml .
mv Berksfile Berksfile.bak
ln -s ~/configs/Berksfile .
cp .chef/encrypted_data_bag_secret ~/.chef/encrypted_data_bag_secret
rm -rf .chef
cd environments
ln -s ~/configs/allinone.json .
cd ../roles
mv os-compute-single-controller.json os-compute-single-controller.json.bak
ln -s ~/configs/os-compute-single-controller.json .
ln -s ~/configs/os-object-storage.json .
