#!/bin/bash

#
# RUN ON YOUR WORKSTATION WITH CHEFDK
#

knife ssl fetch
knife ssl check

knife cookbook  upload --all

knife bootstrap 192.168.100.201 -N node-chef1 -x root -P 'vagrant'
knife bootstrap 192.168.100.202 -N node-chef2 -x root -P 'vagrant'


knife client list

# knife environment create Chef-dev -e vim
knife environment from file apache_env.json
knife environment from file nginx_env.json

# knife role create jboss_role -e vim
knife role from file web_role.json

### remove role
# knife role delete ROLENAME

### bootstrap
knife bootstrap 192.168.100.201 -N chef-node1 -x root -P vagrant -r 'role[apache_web_server]' -E server_type > apache_bootstrap.log
knife bootstrap 192.168.100.202 -N chef-node2 -x root -P vagrant -r 'role[nginx_web_server]' -E server_type > nginx_bootstrap.log


# knife bootstrap chef-node1 --node-name chef-node1 --run-list jboss

### kill node
# knife node delete --yes NODENAME
# knife client delete --yes NODENAME