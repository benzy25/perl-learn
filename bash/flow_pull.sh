#!/bin/bash -e

REPOS=( 
~/med_mattress/
~/parts_online
)


tput setaf 2;echo "Push or Pull?"; tput sgr0

read input

if [ $input =  "push" ]
then

for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    git push origin master 
    sleep 1
    done 
elseif [ "$input" = "pull" ]
then
    
for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    git pull origin master 
    sleep 1
    done 
fi

