#!/bin/bash

sudo apt install python3.8 python3-pip -y
pip3 install ansible 
ansible-playbook test.yml -e user=$USERNAME --ask-become-pass 