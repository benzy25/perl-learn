#!/usr/bin/env bash

die() { echo "$@" 1>&2 ; exit 1; }
KILL="Fuck You"

pushing() {
    tput setaf 3;echo  What Branch?;tput sgr0 
    read -r branch
    tput setaf 3;echo  Where to? You can say 'origin', 'staging', or 'production';tput sgr0 
    read -r ans
    if [ "$ans" = "origin" ] || [ "$ans" = "staging" ] || [ "$ans" = "production" ]
    then
        git push "$ans" "$branch" 
    elif [ "$ans" = "no" ]
    then
        echo "Okay" 
    else die "$KILL"
    fi
}

more() {
    tput setaf 2;echo More?;tput sgr0 
    read -r more
    if [ "$more" = "yes" ]
    then
        pushing
    elif [ "$more" = "no" ]
    then
        die "Goodbye" 
    else die "$KILL"
    fi
}

gitftp() {
tput setaf 3;echo Wanna ftp?;tput sgr0
read -r ftp 
if [ "$ftp" = "yes" ]
then
    git ftp push
elif [ "$ftp" = "no" ]
then
   echo "Okay" 
else die "Fuck You"
fi
}

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
    pushing
    more
    more
elif [ "$push" = "no" ]
then
    echo "Okay" 
else die "$KILL"
fi
