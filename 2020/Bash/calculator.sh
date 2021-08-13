# !/bin/bash
clear
echo "Choose one of the following."
echo ""
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo ""
read -p "Choice: " choice
clear

if choice = '5'; then
    exit 1
fi

read -p 'Enter your first number: ' a
read -p 'Enter your second number: ' b
clear

case $choice in
    1)results= echo "$a + $b" | bc ;;
    2)results= echo "$a - $b" | bc ;;
    3)results= echo "$a \* $b" | bc ;;
    4)results= echo "scale=2; $a / $b" | bc ;;
    *)results= "Choose valid number" ;;
esac
echo "Result : $results"
