#!/bin/bash
# MAKE SURE YOU HAVE WINDOWS SUBSYSTEM FOR LINUX INSTALLED BEFORE YOU RUN THIS SCRIPT
# RUN THIS SCRIPT INSIDE WINDOWS SUBSYSTEM FOR LINUX OR UBUNTU
# sudo ./setup_script.sh
echo "First, update apt-get"
sudo apt-get update

echo "Install pip and other development tools required to install Ansible"
sudo apt-get -y install python-pip python-dev libffi-dev libssl-dev build-essential git;

echo "Upgrade pip";
sudo pip install pip --upgrade;

echo "Install Ansible and grant permissions to the .ansible folder";
sudo pip install ansible --upgrade;
sudo chmod 777 -R $HOME/.ansible;

echo "Install dependencies for Ansible to work with AWS and Azure";
sudo pip install -U boto boto3 appdirs packaging 'azure==2.0.0rc5';

echo "If these version checks ran successfully, everything probably went well.";
python -V;
ansible --version;
ansible

echo "The whole script takes approximately 30 minutes"
echo "sudo pip install ansible is by far the longest command."
echo "If it seems like it's stuck on 'Cleaning up..', you are safe to exit out of it and run the script again."
