#!/bin/bash -x
git init
git add bin configs README.md
git config --global user.name "MIYATA Tadaaki"
git config --global user.email andes@flg.jp
git remote add origin https://github.com/andesm/openstack-chef-repo
git pull -u origin master
