#!/bin/bash
sudo apt-get update
sudo apt install -y python3-pip
sudo pip install ansible
ansible --version