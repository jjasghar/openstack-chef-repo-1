#!/bin/bash -x
cd ~/
sudo apt-get -y update
sudo apt-get -y autoremove
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install ruby-2.1 --default
. ~/.bash_profile
gem install rubygems-update knife-backup spiceweasel
update_rubygems
gem update
sudo dpkg -i ~/deb/chef-server-core_12.1.0-1_amd64.deb
sudo cp ~/configs/chef-server.rb /etc/opscode/
sudo chef-server-ctl reconfigure
sudo chef-server-ctl start
sudo private-chef-ctl reconfigure
mkdir .chef
ln -s ~/configs/knife.rb ~/.chef/knife.rb
sudo chef-server-ctl user-create andesm MIYATA Tadaaki andes@flg.jp openstack --filename .chef/andesm.pem
sudo chef-server-ctl org-create flg FLG --association_user andesm --filename .chef/flg-validator.pem
mkdir git
mkdir -p ~/.berkshelf/
cp ~/configs/config.json ~/.berkshelf/
~/bin/clone_openstack-chef-repo.sh
knife ssl fetch
knife ssl check
knife client list
knife user list
