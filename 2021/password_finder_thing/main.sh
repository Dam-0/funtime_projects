#!/bin/bash

echo "MAIN STUPID THING"
echo
echo "Enter password"

read -p "> " password

python ./password_scrambler.py $password & pids=( $! )
python ./progress_bar.py $password  & pids+=( $! )

wait -n

kill "${pids[@]}" > /dev/null 2>&1

clear

echo "PASSWORD CRACKED"