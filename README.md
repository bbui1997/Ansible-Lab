# Ansible-Lab

The purpose of this lab is to install the minimum software in order to create an EC2 instance on AWS.

## Basic Information
#### Ansible
Ansible is an open source automation language that can describe an IT application infrastructure in Ansible playbooks.

It is an automation engine that runs Ansible Playbooks (yml).

--- 
## System Setup for Linux (CentOS)
#### Prequisites
- A fresh CentOS machine

When starting out with a fresh CentOS machine, it isn't obvious how to get everything setup.

#### Install Development Tools
Development Tools include gcc, g++, make, libtool, rpmbuild, and autoconf. These are required to install other required software (using pip to install ansible). [Link here](https://tecadmin.net/install-development-tools-on-centos/)

`sudo yum update`

`sudo yum groupinstall "Development Tools"`
#### Install Python2.7 with Miniconda2
Ansible was written in Python and when it is called, it calls Python code.

Miniconda is a Python package that contains Python and other important tools necessary, including pip.

1. Download Miniconda2 from [here](https://conda.io/miniconda.html). 
    - Our Ansible machine will need the Linux 64-bit bash installer.
2. Change to a root user: `sudo su -`
3. Move that bash installer to directory "/": `cd /`
    - We plan to make miniconda2 accessable to all users, including root
4. Run the bash installer: `bash Miniconda2-latest-Linux-x86_64.sh`
5. Change your PATH variable after successful install: `PATH=/miniconda2/bin:$PATH`
    - This prepends the Python being used to Miniconda2's Python. You can test this by typing
    `which python` and `which pip`
    - You can do this to your non-root user as well.

#### Install Ansible using pip
Install Ansible using the command: `sudo pip install ansible`.

#### Install boto using pip
`sudo pip install boto`

`sudo pip install boto3`

---
## System Setup for Windows
#### Prerequisites
- Windows 10
- 64 bit installation

## Guide
We will be following this guide: https://www.jeffgeerling.com/blog/2017/using-ansible-through-windows-10s-subsystem-linux

#### Install Windows Subsystem for Linux (WSL)
Ansible requires a Linux environment to be run. Windows released a beta where you can access Ubuntu from your Windows machine.

Follow this guide to get WSL: https://msdn.microsoft.com/en-us/commandline/wsl/install_guide

Steps listed below:

##### Enable the Windows Subsystem for Linux feature
1. Run Powershell as Administrator
2. Run this command: `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
3. Restart your computer when prompted.

##### Turn on Developer Features
1. Click on the Windows key and type 'developer features'.
2. Click on 'Use developer features'.
3. Select the option 'Developer mode'

It should look like this:

![developerMode](http://ec2-96-127-57-62.us-gov-west-1.compute.amazonaws.com/brandon.bui/ACMS-Ansible/raw/master/onboarding/developerFeatures.png)

##### Install Ubuntu
1. Go to your command prompt.
2. Type `bash`.
3. Go through the installation process.
4. To get into WSL, from cmd or PowerShell, type `bash`.


#### Ansible Setup
In this directory, there is a script that will install everything you need for Ansible.

Run the script inside WSL with this command: `sudo ./newJoinerScript.sh`

This script contains these commands if you want to run them individually:
- `sudo apt-get update`
- `sudo apt-get -y install python-pip python-dev libffi-dev libssl-dev build-essential git;`
- `sudo pip install pip --upgrade;`
- `sudo pip install ansible --upgrade;`
- `sudo chmod 777 -R $HOME/.ansible;`
- `sudo pip install -U boto boto3 appdirs packaging 'azure==2.0.0rc5';`


#### End Result
At the end of the script, or after typing `ansible` in the command prompt in WSL, you should see this (ignore the missing target hosts error, you'll learn what that means soon):

![ansibleSuccess](http://ec2-96-127-57-62.us-gov-west-1.compute.amazonaws.com/brandon.bui/ACMS-Ansible/raw/master/onboarding/ansibleSuccess.png)

After typing `ansible --version` in the command prompt in WSL, you should see this:

![ansibleVersionSuccess](http://ec2-96-127-57-62.us-gov-west-1.compute.amazonaws.com/brandon.bui/ACMS-Ansible/raw/master/onboarding/ansibleVersionSuccess.png)

#### Successful Run
Below is an example of what should happen if everything is done correctly.

![Success](https://github.com/bbui1997/Ansible-Lab/blob/master/example.png?raw=true)
---
## Extra Information - Anatomy of Ansible
#### Playbook
Similar to a workflow in HPOO. Playbooks are what we run when using Ansible.
#### Inventory
A file that contains hosts and groups.
#### Groups
A group contains several hosts that you may want to interact with.
#### Hosts
Hosts are remote machines that Ansible manages. For ACMS, we will most likely be using localhost.
`hosts: localhost`
#### Plays
A playbook is a list of plays. A play first takes the host and runs through as many tasks as there are present in the playbook. Tasks and roles are in plays.
#### Roles
Roles are units of organization for Ansible. They can be treated the same as subflows in HP OO. When possible, try to make your plays into roles so you can reuse your plays. A role usually contains several tasks.
#### Tasks
Tasks are the basic unit of actions. Roles, plays, and playbooks contain tasks. Tasks take a module and its parameters and are run by the playbook.
#### Modules
A module is very similar to a function/method in a regular programming language. Tasks are composed of modules. Each module have their own set of required and optional parameters.

Ansible has many built-in modules for your use, but you can create your own.
#### Action
The part of the task that declares which module to use an its parameters.

`task:` <---- Task

&emsp;`- name: Create EC2 Instance` 

&emsp; vvvvvvv Action vvvvvvv

&emsp;`ec2:` <--- Module

&emsp;`region: "us-east-1"`

&emsp;`image: ami-iXXXXXX`

&emsp;`aws_access_key: XXXXXXXXX`

&emsp;`aws_secret_key: XXXXXXXXX`

##### Important Links
http://docs.ansible.com/ansible/glossary.html

http://docs.ansible.com/ansible/playbooks_best_practices.html

https://github.com/ansible/ansible-examples

