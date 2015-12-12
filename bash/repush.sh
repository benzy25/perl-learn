#!/bin/bash

REPOS=( 
~/files/sql 
~/files/plugs 
~/files/robbenz 
~/files/perl_scripts 
~/files/diamedical/diamedical
~/files/diamedical/medmattress
~/files/diamedical/wordpress/backup/
)

for i in “${REPOS[@]}”
do
    cd $i
    git push 
    sleep 1
    done 
