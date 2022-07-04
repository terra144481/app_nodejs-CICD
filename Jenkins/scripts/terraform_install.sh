#!/bin/bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform -version
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o -i "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
<<<<<<< HEAD
pwd
=======
>>>>>>> 42bfb36d3e721c2a26c696a69d6974a9e7555cea
