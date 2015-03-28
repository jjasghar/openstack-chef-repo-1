#!/bin/bash -x
neutron net-create ext-net --router:external True --provider:physical_network external --provider:network_type flat
neutron subnet-create ext-net --name ext-subnet --allocation-pool start=192.168.1.50,end=192.168.1.80 --disable-dhcp --gateway 192.168.1.13 192.168.1.0/24
neutron router-create flg-router
neutron router-gateway-set flg-router ext-net

neutron net-create flg-net
neutron subnet-create flg-net --name flg-subnet --gateway 10.1.1.254 10.1.1.0/24
neutron router-interface-add flg-router flg-subnet
