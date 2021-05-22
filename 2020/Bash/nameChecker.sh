# !/bin/bash
if [ $# -lt 3 ]; then 
    echo 'Error: not enougth arguments enterd' && exit 1


elif [ $# -eq 3 ] && [ -f $@ ]; then
    echo "pass"
    

    if [ $1 -ne $2 ] && [ $1 -ne $3 ]; then
        echo 1
    elif [ $2 -ne $1 ] && [ $2 -ne $3 ]; then
        echo 2
    else
        echo 3




    fi
fi

