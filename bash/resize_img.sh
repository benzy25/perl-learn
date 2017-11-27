#!/usr/bin/env bash

find . -type f -iname "*.jpg" -exec identify -format '%w %h %i\n' {} \; | 
awk '$1 > 800 || $2 > 800 {sub(/^[^ ]* [^ ]* /, ""); print}' |
tr '\n' '\0' |
xargs -0 mogrify -resize '800x800'
