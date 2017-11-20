#!/usr/bin/env bash
#rm -rf rdo-container-registry
#git clone https://github.com/rdo-infra/rdo-container-registry
pushd rdo-container-registry
ansible-playbook -i ../hosts --user=dci -e "host_preparation_docker_disk=/dev/vdb" host-preparation.yml
ansible-playbook -i ../hosts --user=dci openshift-ansible/playbooks/byo/openshift-node/network_manager.yml -e "ansible_ssh_user=dci"
ansible-playbook -i ../hosts --user=dci openshift-ansible/playbooks/byo/config.yml -e "ansible_ssh_user=dci"
popd