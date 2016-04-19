#!/usr/bin/env bash

read -r -p "Database you want to access: " data 

/Applications/MAMP/Library/bin/mysql -uroot -p "$data"

SHOW TABLES;
