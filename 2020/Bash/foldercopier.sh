#!/bin/bash
read -p "Name of folder you like to copy: " folderName

if [ -d $folderName ]; then
    read -p "type the name of the destination folder: " newFolderName
    cp -r $folderName $newFolderName
else
    echo "I couldn't find that folder"
fi
