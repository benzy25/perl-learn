#!/bin/bash

REPOS=( 
~/files/sql 
~/files/plugs 
~/files/robbenz 
~/files/scripts
~/files/diamedical/diamedical
~/files/bash_profile
~/files/diamedical/medmattress
~/files/diamedical/wordpress_backup/
)

for i in “${REPOS[@]}”
do
    cd $i
    git pull
    sleep 1
    done 
