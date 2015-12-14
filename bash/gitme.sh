#!/bin/bash -e

REPOS=( 
~/files/sql 
~/files/plugs 
~/files/robbenz 
~/files/scripts
~/files/bash_profile
~/files/diamedical/diamedical
~/files/diamedical/medmattress
)

MOVE="Moving to next REPO... \n" 

echo what ya wanna do?

read input

if [ $input =  "commit" ]
then
    for i in "${REPOS[@]}"
    do
        cd $i
        tput setaf 6;pwd;tput sgr0 
        git add . -A
        git commit -m "autocommit backup point"
        tput setaf 2;echo  $MOVE;tput sgr0 
        sleep 1
    done 

else 
for i in "${REPOS[@]}"
do
    cd $i
    tput setaf 6;pwd;tput sgr0 
    git $input 
    tput setaf 2;echo  $MOVE;tput sgr0 
    sleep 1
    done 
fi
