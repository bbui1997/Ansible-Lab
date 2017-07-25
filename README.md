# Ansible-Lab

The purpose of this lab is to install the minimum software in order to create an EC2 instance on AWS.

## Basic Information
#### Ansible
Ansible is an open source automation language that can describe an IT application infrastructure in Ansible playbooks.

It is an automation engine that runs Ansible Playbooks (yml).

--- 
## System Setup for Linux (RHEL 6)
#### Prequisites
- A fresh Linux machine

When starting out with a fresh Linux machine, it isn't obvious how to get everything setup.

Since the Ansible machine for ACMS is a RHEL 6 machine, the instructions below will be for RHEL 6 machines.
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

Follow this guide: https://msdn.microsoft.com/en-us/commandline/wsl/install_guide

#### Install Pip
You are going to need pip, along with a whole bunch of other tools: `sudo apt-get -y install python-pip python-dev libffi-dev libssl-dev`

#### Install Ansible
Install Ansible using this command: `sudo pip install ansible --user`

#### Install boto
Install boto using these commands:
 - `sudo pip install boto`
 - `sudo pip install boto3`

#### Update path variables
`echo 'PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc`

`source .bashrc`

#### Make sure you have correct versions of software
Should be Python 2.7: `python -V`

Should be Ansible 2.3+: `ansible --version`


## Anatomy of Ansible
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

