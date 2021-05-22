read -p "Enter Folder Name: " Folder
read -sp "Enter Password: " Password
mkdir $Folder
echo "$Password" > $Folder/secret.txt
