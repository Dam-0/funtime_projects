while true; do
	touch data
	
	python3 coin_value_v2.py
	clear
	
	doge_coin_value=`awk "NR==1" data`
	total_coins=`awk "NR==2" data`
	total_value=$(echo "$doge_coin_value*$total_coins" | bc)
	#cost=`awk "NR==3" data`
	
	#Total
	tcost=x
	tcoins=x
	ttotal_value=$(echo "$doge_coin_value*$tcoins" | bc)
	tprofit=$(echo "$ttotal_value-$tcost" | bc)
	tprofit_percentage=$(echo "(($ttotal_value/$tcost)*100)-100" | bc -l)
	

	echo "Coin Value: $"$doge_coin_value "(AUD)"
	echo "Total Coins: "`printf "%0.2f\n" $total_coins`
	echo "Total Value: $"`printf "%0.2f\n" $total_value`
	echo
	echo "Total:"
	echo "Total Cost: $"$tcost
	echo "Total Profit: $"`printf "%0.2f\n" $tprofit`
	
	rm data
	sleep 5
done