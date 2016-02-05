#!/bin/bash -e

REPOS=( 
~/med_mattress/
~/parts_online
)

tput setaf 2;echo "Push or Pull?"; tput sgr0

read input

for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    git "$input" origin master 
    sleep 1
done 
