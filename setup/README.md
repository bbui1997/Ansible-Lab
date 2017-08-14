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

![developerMode](https://github.com/bbui1997/Ansible-Lab/blob/master/images/developerFeatures.png?raw=true)

##### Install Ubuntu
1. Go to your command prompt.
2. Type `bash`.
3. Go through the installation process.
4. To get into WSL, from cmd or PowerShell, type `bash`.


#### Ansible Setup
In this directory, there is a script that will install everything you need for Ansible.

Run the script inside WSL with this command: `sudo ./setup_script.sh`

This script contains these commands if you want to run them individually:
- `sudo apt-get update`
- `sudo apt-get -y install python-pip python-dev libffi-dev libssl-dev build-essential git;`
- `sudo pip install pip --upgrade;`
- `sudo pip install ansible --upgrade;`
- `sudo chmod 777 -R $HOME/.ansible;`
- `sudo pip install -U boto boto3 appdirs packaging 'azure==2.0.0rc5';`


#### End Result
At the end of the script, or after typing `ansible` in the command prompt in WSL, you should see this (ignore the missing target hosts error, you'll learn what that means soon):

![ansibleSuccess](https://github.com/bbui1997/Ansible-Lab/blob/master/images/ansibleSuccess.png?raw=true)

After typing `ansible --version` in the command prompt in WSL, you should see this:

![ansibleVersionSuccess](https://github.com/bbui1997/Ansible-Lab/blob/master/images/ansibleVersionSuccess.png?raw=true)