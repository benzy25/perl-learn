#!/bin/sh

git add . -A
read -p "Commit description: " desc  
git commit -m "$desc"

tput setaf 2;echo  Wanna Push?;tput sgr0 
read ans
if [ $ans = "yes" ]
then
    git push
fi
