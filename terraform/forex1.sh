#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

echo Deploying...
terraform apply -auto-approve
./update-ansible-inventory.sh

echo "Waiting for servers to come up"
sleep 15

pushd ~/ansible/
ansible-playbook playbooks/add-ca-certs.yml
ansible-playbook playbooks/deploy-ssh.yml
ansible-playbook playbooks/forex_backtest1.yml
ansible-playbook -v playbooks/forex_backtest2.yml
#ansible-playbook -v playbooks/pull-results.yml
