#!/usr/bin/env bash

users() {

wp user list --fields=user_email | grep 'hospital' >> /Users/jeffreyambrose/Desktop/email-tmp/wp_hospital.csv
wp user list --fields=user_email | grep -v 'hospital' >> /Users/jeffreyambrose/Desktop/email-tmp/wp_nursing.csv
}

mkdir ~/Desktop/email-tmp/
cd /Applications/MAMP/htdocs/parts_online
users
sleep 1
cd /Applications/MAMP/htdocs/medmattress
users


cd ~/Desktop/email-tmp/
for s in ./*.csv
do
    grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" "$s" | sort -u > "${s}.csv"
sleep 1
done

for t in ./*.csv
do
    mv "$t" "${t//.csv.csv/.csv}"
done

tput setaf 2; echo "type done when you are finished importing";tput sgr0
read input
if [ "$input" = "done" ]
then 
    rm -rf ~/Desktop/email-tmp/
fi

