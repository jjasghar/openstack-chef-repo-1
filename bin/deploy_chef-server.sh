#!/bin/bash -x
cd ~/
sudo apt-get -y update
#sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
#sudo apt-get -y install git ruby2.0 ruby2.0-dev build-essential
sudo apt-get -y install git
#sudo ln -sf /usr/bin/ruby2.0 /usr/bin/ruby
#sudo gem install bundler rubygems-update rake chef knife-backup 
sudo gem install rubygems-update 
sudo update_rubygems
sudo gem update
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
sudo gem install spiceweasel-2.8.0.gem
cd ~/
mkdir -p ~/.berkshelf/
cp ~/configs/config.json ~/.berkshelf/
~/bin/clone_openstack-chef-repo.sh
knife ssl fetch
knife ssl check
knife client list
knife user list
