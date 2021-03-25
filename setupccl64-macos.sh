#!/bin/bash
# Sets up CCL on MacOS after installing ccl in /Applications
# Run this from sudo or as root

cclscript="/usr/local/bin/ccl"    # /   (root directory)

if ! [ -e "$cclscript" ]
then
cat << EOF > $cclscript
#!/bin/bash
/Applications/ccl/dx86cl64 \$*
EOF
fi
# following needs root
chmod 755 $cclscript

if ! [ -e "${HOME}/quicklisp/setup.lisp" ]
then
echo ${HOME}
ccl -n -l "~/quicklisp.lisp" -e '(quicklisp-quickstart:install)' -e '(ql:add-to-init-file)' -e '(quit)'
fi

# following needs root
ccl -n -e '(test-ccl)'
