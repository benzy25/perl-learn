#!/usr/bin/env bash

read -r -p "Old Domain: " old 
read -r -p "New Domain: " new 


echo "update wp_options set option_value="\"$new\"" where option_name='siteurl';
update wp_options set option_value="\"$new\"" where option_name='home';
UPDATE wp_options SET option_value = replace(option_value, '$old', '$new') WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE wp_posts SET guid = replace(guid, '$old','$new');
UPDATE wp_posts SET post_content = replace(post_content, '$old', '$new');
UPDATE wp_postmeta SET meta_value = replace(meta_value, '$old', '$new');" | pbcopy

