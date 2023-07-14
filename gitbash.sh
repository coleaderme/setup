#!/usr/bin/bash

if [[ $1 == '' ]]
then
  echo -e "USAGE:\n ./gitbash.sh 'commit message'\n"
  exit
fi
git add .
git commit -m "$1"
git push