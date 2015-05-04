#!/bin/bash -x
cd ~
rm -rf .git README.md bin/ configs/
git init
git config --global user.name "MIYATA Tadaaki"
git config --global user.email andes@flg.jp
git remote add origin https://github.com/andesm/openstack-chef-repo
git pull -u origin master

