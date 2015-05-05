#!/bin/bash -x
. ~/.bash_profile
~/bin/chef-init_chef-server.sh
cd ~/git/openstack-chef-repo
spiceweasel -e --novalidation --timeout 3600 infrastructure.yml
