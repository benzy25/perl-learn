#!/bin/bash -e

REPOS=( 
/Applications/MAMP/htdocs/parts_online/
/Applications/MAMP/htdocs/medmattress/
)

tput setaf 2;echo "Enter Start Date:  (ex: 1989-03-25)"; tput sgr0
read START 

tput setaf 2;echo "Enter End Date:  (ex: 1989-03-25)"; tput sgr0
read END

for i in "${REPOS[@]}"
do
    cd "$i"
    tput setaf 6;pwd;tput sgr0 
    wp wc order list --fields=billing_address.first_name,billing_address.last_name,billing_address.company,order_number,total,created_at --status=processing,completed --created_at_min="$START" --created_at_max="$END" --format=csv >> ~/Desktop/report.csv
    sleep 1
done 
