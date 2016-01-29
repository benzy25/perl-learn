#!/bin/bash -e

REPOS=( 
~/med_mattress/
~/parts_online
)

for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    git pull origin master 
    sleep 1
    done 
