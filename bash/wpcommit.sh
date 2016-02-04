#!/usr/bin/env bash

die() { echo "$@" 1>&2 ; exit 1; }

gr="$(git root)"
cd "$gr" 
tput setaf 6;pwd;tput sgr0 

git add . -A
read -r -p "Commit description: " desc  
git commit -m "$desc"

tput setaf 2;echo  Wanna Do Some pushing?;tput sgr0 
read -r push 
if [ "$push" = "yes" ]
then 
    tput setaf 3;echo  What Branch?;tput sgr0 
    read -r branch
    sleep 1
   
    tput setaf 2;echo  Wanna Push to BitBucket?;tput sgr0 
    read -r ans
    if [ "$ans" = "yes" ]
    then
        git push origin "$branch" 
    elif [ "$ans" = "no" ]
    then
        echo "Okay" 
    else die "Fuck You"
    fi
   
    tput setaf 3;echo Wanna Push to Staging Server?;tput sgr0
    read -r staging 
    if [ "$staging" = "yes" ]
    then
        git push staging "$branch" 
    elif [ "$staging" = "no" ]
    then
        echo "Okay" 
    else die "Fuck You"
    fi
    
    tput setaf 3;echo Wanna Push to Production Server?;tput sgr0
    read -r production 
    if [ "$production" = "yes" ]
    then
        git push production master
    elif [ "$production" = "no" ]
    then
        echo "Okay" 
    else die "Fuck You"
    fi

elif [ "$push" = "no" ]
then
    echo "Okay" 
else die "Fuck You"
fi
