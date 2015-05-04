#!/bin/bash -x
cd ~/git/openstack-chef-repo
spiceweasel -e --novalidation --timeout 3600 infrastructure.yml
