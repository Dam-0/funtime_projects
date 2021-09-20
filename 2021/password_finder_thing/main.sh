#!/bin/bash

echo "Password Checker"
echo
echo "Enter password"

read -p "> " password

tmux new-session -d python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/password_scrambler.py $password\; split-window python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/progress_bar.py $password \; attach



echo
echo
echo "The password: $password"
echo "Will take too long to crack"
