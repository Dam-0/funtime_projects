spent=("66.18")
coins=("529.5")
doge_value=`python3 coin_value.py`

current_value=$(echo "$coins*$doge_value" | bc)
profit_calc=$(echo "$spent/$current_value" | bc -l)
profit_percent=$(echo "$profit_calc*100" | bc)
profit=$(echo "$current_value-$spent" | bc)

echo "Spent: $"$spent
echo "Total value: $"$current_value
echo "Profit: $"`printf %.$4f $profit`
echo "Profit Percentage: "`printf %.$4f $profit_percent`"%"
