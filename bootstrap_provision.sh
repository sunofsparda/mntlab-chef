#!/bin/bash

knife ssl fetch
knife ssl check
knife cookbook  upload --all
# knife environment create TEST_NODE -d "Environment for development cookbooks"
# knife environment list

knife bootstrap 192.168.100.102 -x root -P 'vagrant' -N TEST_NODE -E chef-node1 -r 'jboss'
