#!/bin/bash -e

REPOS=( 
~/Desktop/wp_1
~/Desktop/wp_2
~/Desktop/wp_3
~/Desktop/wp_4
~/Desktop/wp_5
~/Desktop/wp_6
~/Desktop/wp_7
~/Desktop/wp_8
~/Desktop/wp_9
~/Desktop/wp_10
)

die() { echo "$@" 1>&2 ; exit 1; }

MOVE="Moving to next REPO... \n" 

WP="/Users/Benz/Desktop/WordPress/"

# else die "Fuck You"

cd "/Users/Benz/Desktop"
sleep 1
tput setaf 6;pwd;tput sgr0 

#git clone git@github.com:WordPress/WordPress.git

sleep 1

for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    #git pull
    #git add . -A
    #git commit -m "autocommit before wp update script"
    
    cp -r "$WP"  "." 

    #git add . -A
    #git commit -m "autocommit after wp update script"
    #git push
    #git ftp push
    tput setaf 2;echo  $MOVE;tput sgr0 
    sleep 1
    done 
