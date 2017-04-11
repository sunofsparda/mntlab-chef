#!/bin/bash

knife ssl fetch
knife ssl check

knife cookbook  upload --all

knife bootstrap 192.168.100.102 -N node-chef1 -x root -P 'vagrant'

knife client list

#knife environment create Chef-dev -e vim
knife environment from file chef-dev_env.json

# knife data bag create newbag
knife data bag from file newbag hudson_databag.json

# knife role create jboss_role -e vim
knife role from file jboss_role.json # NOT WORKING

# knife role delete $role_name # to delete role
