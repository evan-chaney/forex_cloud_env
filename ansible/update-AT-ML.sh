#!/usr/bin/env bash

ansible-playbook -v -i inventories/inventory-ezforex.ini playbooks/update_AT.yml
