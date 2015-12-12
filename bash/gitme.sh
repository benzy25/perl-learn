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

MOVE="${green}Moving to next REPO... \n${reset_color}" 

echo what ya wanna do?

read input

if [ $input =  "commit" ]
then
    for i in "${REPOS[@]}"
    do
        cd $i
        git add . -A
        git commit -m "autocommit backup point"
        tput setaf 2;echo  $MOVE;tput sgr0 
        sleep 1
    done 

else 
for i in "${REPOS[@]}"
do
    cd $i
    git $input 
    tput setaf 2;echo  $MOVE;tput sgr0 
    sleep 1
    done 
fi
