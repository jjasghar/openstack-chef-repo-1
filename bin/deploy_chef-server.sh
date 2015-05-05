#!/bin/bash -x
cd ~/
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install ruby-2.1 --default
. ~/.bash_profile
gem install rubygems-update knife-backup
update_rubygems
gem update
cd ~/deb
sudo dpkg -i chef-server-core_12.0.8-1_amd64.deb
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
gem install spiceweasel-2.8.0.gem
cd ~/
mkdir -p ~/.berkshelf/
cp ~/configs/config.json ~/.berkshelf/
~/bin/clone_openstack-chef-repo.sh
knife ssl fetch
knife ssl check
knife client list
knife user list
