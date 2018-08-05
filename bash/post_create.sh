#!/bin/bash -e 
tput setaf 2;echo "Post type: "; tput sgr0
read -r POST 

tput setaf 2;echo "How many posts: "; tput sgr0
read -r COUNT

tput setaf 2;echo "Unique titles? [y/n]: "; tput sgr0
read -r UNIQUE 

#wp user list | grep 'insideout'
wp user list

tput setaf 2;echo "User ID (int): "; tput sgr0
read -r ID

#for i in {1..$(echo "$COUNT")}
for ((i = 1; i <= COUNT; i++))
do
    if UNIQUE = y
        tput setaf 2;echo "Title $i: "; tput sgr0
        read -r TITLE 
        wp post create  --post_type="$POST" --post_content="hey" --post_author="$ID" --post_title="$TITLE" --post_status="publish" 
    else 
    wp post create  --post_type="$POST" --post_content="hey" --post_author="$ID" --post_title="Sample Number $i" --post_status="publish" 
fi
done 
