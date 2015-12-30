#!/bin/bash
# Installs CCL on x86 Linux
# run this as root from your (user-level) home directory
# Set the date on the system first, if it's not already
apt-get update
apt-get install -y emacs
apt-get install -y build-essential
apt-get install -y m4
apt-get install -y subversion
apt-get install -y git
apt-get install -y mercurial
apt-get install -y rlwrap
apt-get install -y host
apt-get install -y locate
apt-get install -y openssh-server

cd
wget http://beta.quicklisp.org/quicklisp.lisp

cd /usr/local/src/
svn co http://svn.clozure.com/publicsvn/openmcl/trunk/linuxx86/ccl

# now run setupccl64.sh or setupccl32.sh