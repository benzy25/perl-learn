#!/bin/sh

git add . -A
read -p "Commit description: " desc  
git commit -m "$desc"

read -p "push?" ans
if [ ans = "yes" ]
then
do
    git push
done
fi
