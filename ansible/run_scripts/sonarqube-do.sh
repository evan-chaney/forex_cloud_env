#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

echo Deploying...
pushd ~/terraform/sonarqube-do/
terraform apply -auto-approve

sleep 35

pushd ~/ansible/ || exit
ansible-playbook -i inventories/inventory-sonarqube.ini playbooks/add-ca-certs.yml
ansible-playbook -i inventories/inventory-sonarqube.ini playbooks/deploy-ssh.yml
ansible-playbook -i inventories/inventory-sonarqube.ini playbooks/do_agent.yml
ansible-playbook -i inventories/inventory-sonarqube.ini playbooks/sonarqube.yml
