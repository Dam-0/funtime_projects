#!/bin/bash

echo "OS: $(lsb_release -sd)"
echo "Kernel: $(uname -r)"
echo "Packages: $(dpkg-query -f '.\n' -W | wc -l) (pkg)"
echo "Shell: $SHELL"
echo "CPU: $(lscpu | grep 'Model name' | cut -f 2 -d ":" | awk '{$1=$1}1')"
echo "GPU: $(lshw -C display  2>/dev/null | grep 'product' | cut -f 2 -d ":") $(lshw -C display  2>/dev/null | grep 'bus info' | cut -f 2 -d ":")"
echo "Mem: "