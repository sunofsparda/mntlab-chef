#!/bin/bash

#
# RUN ON YOUR WORKSTATION WITH CHEFDK
#

knife ssl fetch
knife ssl check

knife cookbook  upload --all

knife bootstrap 192.168.100.102 -N node-chef1 -x root -P 'vagrant'

knife client list

# knife environment create Chef-dev -e vim
knife environment from file chef-dev_env.json

# knife data bag create newbag
knife data bag from file newbag hudson_databag.json

# knife role create jboss_role -e vim
knife role from file jboss_role.json

### remove role
# knife role delete ROLENAME

### bootstrap
knife bootstrap 192.168.100.102 -N chef-node1 -x root -P vagrant -r 'role[jboss]' -E "Chef-dev" > bootstrap.log
# knife bootstrap chef-node1 --node-name chef-node1 --run-list jboss

### kill node
# knife node delete --yes NODENAME
# knife client delete --yes NODENAME