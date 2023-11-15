#!/bin/bash
yum install ansible -y 
cd /tmp
git clone https://github.com/sivadevopsdaws74s/ansible-roboshop-roles.git
cd ansible-roboshop-roles
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/mongodb /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/redis /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/mysql /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/rabbitmq /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/catalogue /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/user /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/cart /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/shipping /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/payment /tmp/ansible-roboshop-roles/main.yml
ansible-playbook -i inventory -e ansible_user=centos -e ansible_password=DevOps321 -e component=/tmp/ansible-roboshop-roles/roles/web /tmp/ansible-roboshop-roles/main.yml
