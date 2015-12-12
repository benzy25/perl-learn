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

echo What ya wanna do?

read input

if [ $input =  "commit" ]
then
    for i in “${REPOS[@]}”
    do
        cd $i
        git add . -A
        git commit -m "autocommit backup point"
        echo  "Moving to Next REPO...
         "
        sleep 1
    done 

else 
for i in “${REPOS[@]}”
do
    cd $i
    git $input 
    echo "Moving to Next REPO...
     "
    sleep 1
    done 
fi
