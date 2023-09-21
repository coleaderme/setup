#!/usr/bin/sh
# first link sh -> dash
# otherwise bash will be mess up.
[ -z "$1" ] && echo "USAGE:\n ./gitbash.sh 'commit message'\n" && exit
git add .
git commit -m "$1"
git push
