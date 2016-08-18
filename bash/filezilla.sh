#!/bin/bash -e

rm -rf /Applications/FileZilla.app/
mv ~/Documents/FileZilla.app/ /Applications/
rm -rf ~/Documents/FileZilla*
open /Applications/FileZilla.app/
