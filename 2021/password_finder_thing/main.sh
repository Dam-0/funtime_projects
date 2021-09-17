#!/bin/bash

echo "Password Checker"
echo
echo "Enter password"

read -p "> " password

#tmux new-session -d bash
#tmux split-window -h bash
#sends keys to first and second terminals
#tmux send -t 0:0.0 "python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/password_scrambler.py $password" C-m
#tmux send -t 0:0.1 "python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/progress_bar.py $password" C-m
#tmux -2 attach-session -d
tmux new-session -d -s test1 -n test2 "python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/password_scrambler.py $password "\
tmux split-window -t test1:test2 "python /home/damo/GitHub/funtime_projects/2021/password_finder_thing/progress_bar.py $password"
tmux a
#tmux new-session -d 'htop' \; split-window -h 'htop' \;


#wait -n

#kill "${pids[@]}" > /dev/null 2>&1


echo
echo
echo "Your password has been cracked!!"
echo "The password: $password is not STRONG"
