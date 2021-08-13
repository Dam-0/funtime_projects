read -p "type for name: " folderName

if [ -d $folderName ]; then
    ls "$folderName"
else
    echo "$folderName does not exist."
fi


