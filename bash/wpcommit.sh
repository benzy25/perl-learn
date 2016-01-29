#!/bin/sh
die() { echo "$@" 1>&2 ; exit 1; }
git add . -A
read -r -p "Commit description: " desc  
git commit -m "$desc"

tput setaf 2;echo  Wanna Push to BitBucket?;tput sgr0 
read -r ans
if [ "$ans" = "yes" ]
then
    git push origin master
elif [ "$ans" = "no" ]
then
   echo "Okay" 
else die "Fuck You"
fi
tput setaf 3;echo Wanna Push to Staging Server?;tput sgr0
read -r staging 
if [ "$staging" = "yes" ]
then
    git push staging master
elif [ "$ans" = "no" ]
then
   echo "Okay" 
else die "Fuck You"
fi
tput setaf 3;echo Wanna Push to Production Server?;tput sgr0
read -r production 
if [ "$production" = "yes" ]
then
    git push production master
elif [ "$ans" = "no" ]
then
   echo "Okay" 
else die "Fuck You"
fi
