#!/bin/bash
#
# Installation automatique d'Ansible sous RHEL7/CentOS7/Fedora
# Bilal Kalem
# Script libre: GPLv3
#
# Syntaxe: # chmod +x bootstrap-mgmt-rpm.sh ; ./bootstrap-mgmt-rpm.sh

## Si besoin de configurer adresse IPV4 Manuel ##
#
# nmcli con mod eno16777728 ipv4.addresses 172.24.10.10/24
# nmcli con mod eno16777728 ipv4.gateway 172.24.10.2
# nmcli con mod eno16777728 ipv4.dns 172.24.10.2
# nmcli con mod eno16777728 ipv4.dns-search ios.dz
# nmcli con mod eno16777728 ipv4.method manual
# nmcli con up eno16777728
# systemctl restart network
##

# install epel-release 7.8 RPM repo
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm

sudo yum -y update

sudo yum -y install ansible

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