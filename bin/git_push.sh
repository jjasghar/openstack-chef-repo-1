#!/bin/bash -x
if [ $# -ne 1 ]; then
	exit
fi
cd ~
git add bin configs README.md
git commit -m \"$1\"
git pull -u origin master

