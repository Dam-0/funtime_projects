#!/bin/bash
[ -f secret.txt ] && cat secret.txt && exit
echo "secret.txt cannot be found in this directory"




# if [ -f secret.txt ]; then
#     cat ./secret.txt
# else
#     echo "secret.txt cannot be found in this directory"
# fi

