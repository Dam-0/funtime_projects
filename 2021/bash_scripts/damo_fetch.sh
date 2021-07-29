#!/bin/bash

echo "OS: $(lsb_release -sd)"
echo "Kernel: $(uname -r)"
echo "Packages: $(dpkg-query -f '.\n' -W | wc -l)(pkg)"
echo "Shell: $SHELL"
echo "Terminal: "
echo "Cpu: "
echo "Gpu: "
echo "Mem: "
