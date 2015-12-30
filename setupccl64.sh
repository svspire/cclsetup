#!/bin/bash
# Run this from sudo or as root

cclscript="/usr/local/bin/ccl"    # /   (root directory)

if ! [ -e "$cclscript" ]
then
cat << EOF > $cclscript
#!/bin/bash
/usr/local/src/ccl/lx86cl64 \$*
EOF
fi
chmod 755 $cclscript

ccl -l "quicklisp.lisp" -e '(quicklisp-quickstart:install)' -e '(ql:add-to-init-file)' -e '(quit)'

ccl -e '(test-ccl)'