echo "MAIN STUPID THING"
echo
echo "Enter password"

read -p "> " password

python ./password_scrambler.py $password &
#python ./progress_bar.py $password &