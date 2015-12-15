#!/bin/bash -e

mkdir ~/Desktop/email-tmp/
sleep 1
cd ~/Desktop/email-tmp/
sleep 1
unzip ~/Desktop/OneDrive-*.zip
sleep 3

for f in ./*.xlsx
do
    mv "$f" "${f// /_}"
    sleep 2
done
ls

for k in ./*.xlsx
do
    xlsx2csv "$k" "${k}.csv"
done
sleep 1

rm ./*.xlsx

for g in ./*.csv
do
    mv "$g" "${g//.xlsx/}"
done
ls

#rm ~/Desktop/OneDrive-*.zip
#awk -F "\"*,\"*" '{print $7}'
