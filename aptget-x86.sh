#!/bin/bash
# Installs CCL on x86 Linux
# run this as root from your (user-level) home directory
# Set the date on the system first, if it's not already set
apt-get update
apt-get install -y mercurial
apt-get install -y emacs
apt-get install -y git
apt-get install -y build-essential
apt-get install -y m4
apt-get install -y rlwrap
apt-get install -y host
apt-get install -y locate
apt-get install -y openssh-server

cd
wget http://beta.quicklisp.org/quicklisp.lisp

cd /usr/local/src/
git clone https://github.com/Clozure/ccl/releases/download/v1.11.5/ccl-1.11.5-linuxx86.tar.gz

# now run setupccl64.sh or setupccl32.sh