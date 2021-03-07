#!/bin/bash
#
# Set hostname
#
hostnamectl set-hostname ${appliedhostname}

#
# Patch
#
sudo yum update -y
sudo yum install epel-release
sudo yum install git -y
sudo yum install ansible -y
cd /tmp
sudo git clone https://github.com/MathialaganR/ansible-tomcat-trmb.git
cd /tmp/ansible-tomcat-trmb/tomcatapp/ansible.d/roles
ansible-playbook tomcatplaybook.yml
