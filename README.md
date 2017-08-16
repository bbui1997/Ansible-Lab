# Ansible-Lab

The purpose of this lab is to install the minimum software in order to create an EC2 instance on AWS.

## Basic Information
#### Ansible
Ansible is an open source automation language that can describe an IT application infrastructure in Ansible playbooks.

It is an automation engine that runs Ansible Playbooks (yml).

## Setup
There are guides to setup Ansible for CentOS machines and Windows machines ![here](https://github.com/bbui1997/Ansible-Lab/tree/master/setup).

Ubuntu users simply run sudo ./setup_script.sh inside the setup folder.

## Training Lab
Give a shot at the training lab (trainingLab.yml). If everything goes correctly, you should be able to create an EC2 instance using Ansible!

Below is an example of what should happen if everything is done correctly.

![Success](https://github.com/bbui1997/Ansible-Lab/blob/master/images/completedLab.png?raw=true)
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

