#!/bin/bash -e

mkdir ~/Desktop/email-tmp/
sleep 1
cd ~/Desktop/email-tmp/
sleep 1
unzip ~/Desktop/OneDrive-*.zip
sleep 1

for f in ./*.xlsx
do
    mv "$f" "${f// /_}"
    sleep 1
done
ls

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
ls

sleep 1

for s in ./*.csv
do
   # awk -F "\"*,\"*" '{print $7}' "$s" >> "${s}"
   # csvquote "$s" | awk -F, '{print $7}' | sort | uniq | csvquote -u > Floors.csv
    csvquote "$s" | awk -F "\"*,\"*" '{print $7}' | sort | uniq | csvquote -u > "${s}.csv" 
sleep 1
done

mkdir ~/Desktop/new-csv

mv ./*.csv.csv ~/Desktop/new-csv

cd ~/Desktop/new-csv

rm -rf ~/Desktop/email-tmp

for t in ./*.csv
do
    mv "$t" "${t//.csv.csv/.csv}"
done
ls

#rm ~/Desktop/OneDrive-*.zip
