#!/bin/bash -x
keystone service-create --name cinder --type volume   --description "Cinder Volume Service"
keystone endpoint-create --service-id $(keystone service-list | awk '/ volume / {print $2}')  --publicurl http://192.168.1.2:8776/v1/%\(tenant_id\)s  --internalurl http://192.168.1.2:8776/v1/%\(tenant_id\)   --adminurl http://192.168.1.2:8776/v1/%\(tenant_id\)s  --region RegionOne
service apache2 restart
service memcached restart


