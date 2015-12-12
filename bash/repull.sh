#!/bin/bash

REPOS=( 
~/files/sql 
~/files/plugs 
~/files/robbenz 
~/files/scripts
~/files/diamedical/diamedical
~/files/diamedical/medmattress
~/files/diamedical/wordpress/backup/
)

for i in “${REPOS[@]}”
do
    cd $i
    git pull
    sleep 1
    done 
