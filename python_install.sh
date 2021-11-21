#!/bin/bash
# if set first argument then install python that version, else default 3.9.6
# https://tecadmin.net/install-python-3-8-ubuntu/


python_version="3.9.6"

# check first command argument
# if first command argument is empty, then install default value 3.9.6
if [ -n "$1" ]              
then
 echo "Параметр #1: $1"     
 python_version=$1
fi

python_version_senior=python${python_version:0:3}
# python_version_short="3.9"
# wget "https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz"


# Step 1 – Installing Prerequisite
# As you are going to install Python 3.8 from the source. You need to install some development libraries to compile Python source code. Use the following command to install prerequisites for Python:

apt-get install build-essential checkinstall
apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

# Step 2 – Download Python 3.8
# Download Python source code using the following command from python official site. You can also download the latest version in place of the specified below.

# cd /opt
wget https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz
# Then extract the downloaded source archive file
tar xzf Python-${python_version}.tgz

# Step 3 – Compile Python Source
# Use the below set of commands to compile Python source code on your system using the altinstall command.

cd Python-${python_version}
./configure --enable-optimizations
make altinstall

# is used to prevent replacing the default python binary file /usr/bin/python.

# Step 4 – Check Python Version
# Check the installed version of python using the following command. As you have not overwritten the default Python version on the system, So you have to use Python 3.8 as follows:

python{$python_version_senior} -V

# Python-3.8.12
# After successful installation remove the downloaded archive to save disk space

# cd /opt
rm -f Python-${python_version}.tgz
