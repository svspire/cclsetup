#!/bin/bash
# Sets up CCL on 64-bit computers after running aptget-x86.sh
# Run this from sudo or as root

cclscript="/usr/local/bin/ccl"    # /   (root directory)

if ! [ -e "$cclscript" ]
then
cat << EOF > $cclscript
#!/bin/bash
/usr/local/src/ccl/lx86cl64 \$*
EOF
fi
# following needs root
chmod 755 $cclscript

if ! [ -e "${HOME}/quicklisp/setup.lisp" ]
then
echo ${HOME}
ccl -l "~/quicklisp.lisp" -e '(quicklisp-quickstart:install)' -e '(ql:add-to-init-file)' -e '(quit)'
fi

# following no longer works without SVN
# ccl -e '(test-ccl)'
