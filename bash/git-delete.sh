#!/usr/bin/env bash

# get the root directory in case you run script from deeper into the repo
gr="$(git rev-parse --show-toplevel)"
cd "$gr" || exit
tput setaf 5;pwd;tput sgr0 

# delete all deleted files 
git status -s | grep -E '^ D' | cut -d ' ' -f3 | xargs git add --all
