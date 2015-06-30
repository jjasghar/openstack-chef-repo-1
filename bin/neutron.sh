#!/bin/bash -x
neutron net-create pppoe --provider:physical_network pppoe --provider:network_type flat
neutron subnet-create pppoe --name pppoe-subnet --allocation-pool start=219.117.195.35,end=219.117.195.35 --disable-dhcp 219.117.195.35/24
#
neutron net-create ext-net --router:external --provider:physical_network external --provider:network_type flat
neutron subnet-create ext-net --name ext-subnet --allocation-pool start=192.168.1.40,end=192.168.1.40 --allocation-pool start=192.168.1.50,end=192.168.1.80 --disable-dhcp --gateway 192.168.1.13 192.168.1.0/24
neutron port-create ext-net --fixed-ip ip_address=192.168.1.40
#
neutron net-create flg-net
neutron subnet-create flg-net --name flg-subnet --gateway 10.1.1.254 --dns-nameserver 192.168.1.13 10.1.1.0/24
#
neutron router-create flg-router
neutron router-gateway-set flg-router ext-net
neutron router-interface-add flg-router flg-subnet
#
nova boot --flavor m1.tiny  --image cirros  router --nic net-id=$(neutron net-list | awk '/ pppoe / {print $2}') --nic port-id=$(neutron port-list | awk '/192.168.1.40/ {print $2}')
nova boot --flavor m1.tiny  --image cirros test --nic net-id=$(neutron net-list | awk '/ flg-net / {print $2}') 

