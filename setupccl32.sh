#!/bin/bash
# Sets up CCL on 32-bit computers after running aptget-x8632.sh
# Run this from sudo or as root

cclscript="/usr/local/bin/ccl"    # /   (root directory)

if ! [ -e "$cclscript" ]
then
cat << EOF > $cclscript
#!/bin/bash
/usr/local/src/ccl/lx86cl $*
EOF
fi
chmod 755 $cclscript

ccl -n -l "quicklisp.lisp" -e '(quicklisp-quickstart:install)' -e '(ql:add-to-init-file)' -e '(quit)'

ccl -n -e '(test-ccl)'