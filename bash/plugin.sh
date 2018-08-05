#!/usr/bin/env bash

# get the root directory in case you run script from deeper into the repo
gr="$(git rev-parse --show-toplevel)"
cd "$gr" || exit

tput setaf 5;pwd;tput sgr0 

read -r -p "Plugin Folder Name: " dir
mkdir wp-content/plugins/"$dir"

read -r -p "Plugin File Name: " file 

echo "<?php" >> wp-content/plugins/"$dir"/"$file"
echo "/*" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Plugin Name: " name 
echo "Plugin Name: $name" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Plugin URI: " uri
echo "Plugin URI: $uri" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Plugin Description: " desc 
echo "Description: $desc" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Version: " version 
echo "Version: $version" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Author: " author 
echo "Author: $author" >> wp-content/plugins/"$dir"/"$file"

read -r -p "Author URI: " auri
echo "Author URI: $auri" >> wp-content/plugins/"$dir"/"$file"

echo "License: GPL2" >> wp-content/plugins/"$dir"/"$file"
echo "*/" >> wp-content/plugins/"$dir"/"$file"

atom wp-content/plugins/"$dir"/"$file"
