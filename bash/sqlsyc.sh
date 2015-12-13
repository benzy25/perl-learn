#!/bin/sh

# (1) set up all the mysqldump variables
FILE=diamedical.sql.`date +"%Y%m%d"`
DBSERVER="11.50.0.30"
DATABASE="diamedic"
USER="diamedic"
PASS="D#HD3gh97e2hR!"

# remove the previous version
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

# dump options
# database server on a separate host:
mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}
# database server on localhost. add other options if need be.
#mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# zip dump file
gzip $FILE

# tell em
tput setaf 2;echo "${FILE}.gz was created:";tput sgr0
ls -l ${FILE}.gz
