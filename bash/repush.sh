#!/bin/bash

REPOS=( 
~/files/sql 
~/files/plugs 
~/files/robbenz 
~/files/scripts
~/files/bash_profile
~/files/diamedical/diamedical
~/files/diamedical/medmattress
)

for i in “${REPOS[@]}”
do
    cd $i
    git push 
    sleep 1
    done 
