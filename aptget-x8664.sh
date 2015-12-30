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

cd
wget http://beta.quicklisp.org/quicklisp.lisp

cd /usr/local/src/
svn co http://svn.clozure.com/publicsvn/openmcl/trunk/linuxx86/ccl

cclscript="/usr/local/bin/ccl"    # /   (root directory)

if ! [ -e "$cclscript" ]
then
cat << EOF > $cclscript
#!/bin/bash
/usr/local/src/ccl/lx86cl64 $*
EOF
fi
chmod 755 $cclscript

cclscript32="/usr/local/bin/ccl32"    # /   (root directory)

if ! [ -e "$cclscript32" ]
then
cat << EOF > $cclscript32
#!/bin/bash
/usr/local/src/ccl/lx86cl $*
EOF
fi
chmod 755 $cclscript32
