#!/bin/bash -e

NOW=$(date +"%m.%d.%Y")

mkdir ~/Desktop/email-tmp/
cd ~/Desktop/email-tmp/ || exit
unzip ~/Desktop/OneDrive-*.zip
sleep 1
for f in ./*.xlsx
do
    mv "$f" "${f// /_}"
    sleep 1
done
for k in ./*.xlsx
do
    ssconvert -v "$k" "${k}.csv"
done
sleep 1
rm ./*.xlsx
for g in ./*.csv
do
    mv "$g" "${g//.xlsx/}"
done
sleep 1
for s in ./*.csv
do
    grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" "$s" | sort -u > "${s}.csv"
sleep 1
done

mkdir ~/Desktop/new-csv
sleep 1
mv ./*.csv.csv ~/Desktop/new-csv
sleep 1 
cd ~/Desktop/new-csv || exit
sleep 1
rm -rf ~/Desktop/email-tmp
sleep 1
for t in ./*.csv
do
    mv "$t" "${t//.csv.csv/.csv}"
done

tput setaf 2;echo "are there multiple hospital databases?";tput sgr0
read -r hospital
if [ "$hospital" = "yes" ]
then
    cd ~/Desktop/new-csv/ || exit
    pwd
    touch all_hospital.csv
    cat Hospi* >> all_hospital.csv
fi

tput setaf 2;echo "nursing school?";tput sgr0
read -r NS 
if [ "$NS" = "yes" ]
then
    cd ~/Desktop/new-csv/ || exit
    pwd
    touch all_ns.csv
    cat Nursin* >> all_ns.csv
fi

tput setaf 2;echo "camp?";tput sgr0
read -r CAMP 
if [ "$CAMP" = "yes" ]
then
    cd ~/Desktop/new-csv/ || exit
    pwd
    touch all_camp.csv
    cat Camp* >> all_camp.csv
fi

tput setaf 2;echo "type done when you are finished importing";tput sgr0
read -r input
if [ "$input" = "done" ]
then
    mkdir ~/Documents/email-blasts/Databases/"$NOW"
    mv ~/Desktop/new-csv/*.csv ~/Documents/email-blasts/Databases/"$NOW"
fi

rm -rf ~/Desktop/OneDrive-*.zip
rm -rf ~/Desktop/new-csv
