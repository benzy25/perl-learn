#!/bin/bash

#FTP Details
HOST=diamedicalusa.com
USER=diamedical
PASS="VG5D&a~FU;i"

#GIT Details
REPO=/Users/Benz/files/diamedical/diamedical/

NEWCOPY=/Users/Benz/Desktop/diamedical/

rm -fr $NEWCOPY
mkdir $NEWCOPY

#get current clean git list
cd $REPO
git ls-tree --full-tree -r HEAD | grep -v 'sql/' | grep -v 'adodb.inc.php' | grep -v 'images/' |  grep -v 'Catalog.pdf' | awk '{print $4}' > /tmp/ftplist.txt

#change to copy directory
cd $NEWCOPY

wget -x -B ftp://${USER}:${PASS}@${HOST}/ -i /Users/Benz/Desktop/dialist.txt 
