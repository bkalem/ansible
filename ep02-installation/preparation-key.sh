#!/bin/bash
#
# Installation automatique d'Ansible sous RHEL7/CentOS7/Fedora
# Bilal Kalem
# Script libre: GPLv3
#

## préparation de la communication entre Ansible et nodes

ssh-keyscan lb web1 web2 web3 web4 web5 >> .ssh/known_hosts

ansible all -m ping --ask-pass

ls -al .ssh/

ssh-keygen -t rsa -b 2048

ansible-playbook e45-ssh-addkey.yml --ask-pass

## voir la différence avec et sans "sudo"
ansible web1 -m yum -a "name=ntp state=installed"

ansible web1 -m yum -a "name=ntp state=installed" --become