#!/bin/sh
die() { echo "$@" 1>&2 ; exit 1; }
git add . -A
read -r -p "Commit description: " desc  
git commit -m "$desc"

tput setaf 2;echo  Wanna Push?;tput sgr0 
read -r ans
if [ "$ans" = "yes" ]
then
    git push
elif [ "$ans" = "no" ]
then
   echo "Okay" 
else die "Fuck You"
fi
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
