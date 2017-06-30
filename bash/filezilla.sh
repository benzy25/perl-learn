#!/bin/bash -e

rm -rf /Applications/FileZilla.app/
mv ~/Downloads/FileZilla.app/ /Applications/
rm -rf ~/Downloads/FileZilla*
open /Applications/FileZilla.app/
