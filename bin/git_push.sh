#!/bin/bash -x
if [ $# -ne 1 ]; then
	exit
fi
cd ~
git config --global user.name "MIYATA Tadaaki"
git config --global user.email andes@flg.jp
git remote add origin https://github.com/andesm/openstack-chef-repo
git add bin configs README.md
git commit -m \"$1\"
git push -u origin master

