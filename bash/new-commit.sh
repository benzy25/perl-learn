#!/usr/bin/env bash

# die script -- just in case
die() { echo "$@" 1>&2 ; exit 1; }

# kill message when dead 
KILL="Fine, Fuck You."

# get the root directory in case you run script from deeper into the repo
gr="$(git rev-parse --show-toplevel)"
cd "$gr" || exit
tput setaf 5;pwd;tput sgr0 

# begin commit input
git add . -A
read -r -p "Commit description: " desc  
git commit -m "$desc"

# find out if we push
tput setaf 2;echo  wanna push?;tput sgr0 
read -r push 
if [ "$push" = "yes" ]
then
    tput setaf 1;echo  What Branch?;tput sgr0 
    git branch
    read -r branch
    git push origin "$branch"
    #git push origin master
else die "$KILL"
fi
