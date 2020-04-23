#!/bin/bash

array=$(git submodule status | awk '{ print $2 }')
for t in ${array[@]}; do
  echo "$(tput setaf 1)$t"
  git-fame --silent-progress $t
done

