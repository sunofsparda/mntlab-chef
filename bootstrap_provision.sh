#!/bin/bash

knife ssl fetch
knife ssl check

knife cookbook  upload --all

knife bootstrap 192.168.100.102 -N node-chef1 -x root -P 'vagrant'

knife client list

