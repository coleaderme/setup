#!/usr/bin/sh
#
[ -z "$1" ] && echo "USAGE:\n ./gitbash.sh 'commit message'\n" && exit
git add .
git commit -m "$1"
git push
