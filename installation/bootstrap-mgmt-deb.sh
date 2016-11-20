#!/bin/bash
#
# Installation automatique d'Ansible sous Debian/Ubuntu
# Bilal Kalem
# Script libre: GPLv3
#
# Syntaxe: # chmod +x bootstrap-mgmt-deb.sh ; ./bootstrap-mgmt-deb.sh

# Clean Ubuntu installation
rm -rf /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock

# Add repository for Ansible
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible

apt-get update

apt-get -y install ansible && echo "Bravo: Ansible est installé avec succès"


# autoriser un utilisateur pour le sudo
echo "bkalem  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

cat >> /etc/hosts << FIN

#ENVIRONEMENT DE PRODUCTION
172.24.10.10	mgmt 	mgmt.ios.dz	ansible.ios.dz
172.24.10.11	lb 		lb.ios.dz  	www.ios.dz

172.24.10.21	web1	web1.ios.dz
172.24.10.22	web2	web2.ios.dz
172.24.10.23	web3	web3.ios.dz
172.24.10.24	web4	web4.ios.dz
172.24.10.25	web5	web5.ios.dz
FIN