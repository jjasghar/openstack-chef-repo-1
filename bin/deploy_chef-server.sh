#!/bin/sh -x
cd ~/
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y install git ruby ruby-dev build-essential openssh-server
sudo gem install bundler rubygems-update rake chef knife-backup 
sudo update_rubygems
sudo gem update
cd ~/deb
sudo dpkg -i chef-server-core_12.0.5-1_amd64.deb
sudo cp ~/configs/chef-server.rb /etc/opscode/
sudo chef-server-ctl reconfigure
sudo chef-server-ctl start
sudo private-chef-ctl reconfigure
sleep 30
cd ~/
mkdir .chef
ln -s ~/configs/knife.rb ~/.chef/knife.rb
cd ~/
sudo chef-server-ctl user-create andesm MIYATA Tadaaki andes@flg.jp openstack --filename .chef/andesm.pem
sudo chef-server-ctl org-create flg FLG --association_user andesm --filename .chef/flg-validator.pem
knife ssl fetch
mkdir git
cd git
git clone https://github.com/mattray/spiceweasel
cd spiceweasel/
mv spiceweasel.gemspec spiceweasel.gemspec.bak
ln -s ~/configs/spiceweasel.gemspec .
gem build spiceweasel.gemspec
sudo gem install spiceweasel-2.8.0.gem
cd ~/git
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
ln -s ~/configs/os-object-storage.json
cd ~/
mkdir -p ~/.berkshelf/
cp ~/configs/config.json ~/.berkshelf/
knife ssl fetch
knife ssl check
knife client list
knife user list
