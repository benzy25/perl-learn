#!/usr/bin/env bash

read -r -p "Product Name: " name
echo "$name Created"

read -r -p "Price: " price

read -r -p "Sku: " sku
 
read -r -p "Category: " category


wp wc product create --title="$name" --sku="$sku" --regular_price="$price" --categories="$category" 
