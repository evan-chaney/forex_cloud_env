#!/usr/bin/env bash

export ANSIBLE_HOST_KEY_CHECKING=False

echo Deploying...
terraform apply -auto-approve
./update-ansible-inventory.sh

echo "Waiting for servers to come up"
sleep 60

pushd ~/ansible/
ansible-playbook playbooks/add-ca-certs.yml
ansible-playbook playbooks/deploy-ssh.yml
ansible-playbook playbooks/do_agent.yml
ansible-playbook playbooks/forex_backtest1.yml
#for run in {1..10} ; do
#    echo Executing run number $run
    ansible-playbook -v playbooks/forex_backtest2.yml
#done
#ansible-playbook -v playbooks/pull-results.yml

popd
terraform destroy -auto-approve