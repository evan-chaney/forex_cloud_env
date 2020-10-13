#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

echo Deploying...
pushd ~/terraform/testapp1-do/
terraform apply -auto-approve

sleep 35

pushd ~/ansible/ || exit
ansible-playbook -i inventories/inventory-testapp1.ini playbooks/add-ca-certs.yml
ansible-playbook -i inventories/inventory-testapp1.ini playbooks/deploy-ssh.yml
ansible-playbook -i inventories/inventory-testapp1.ini playbooks/do_agent.yml
ansible-playbook -i inventories/inventory-testapp1.ini playbooks/testapp1.yml
