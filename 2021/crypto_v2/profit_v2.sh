while true; do
	touch data
	
	python3 coin_value_v2.py
	clear
	
	doge_coin_value=`awk "NR==1" data`
	total_coins=`awk "NR==2" data`
	total_value=$(echo "$doge_coin_value*$total_coins" | bc)
	#cost=`awk "NR==3" data`
	
	##Damos stuff
	#dcost=106.92
	#dcoins=734.34
	#dtotal_value=$(echo "$doge_coin_value*$dcoins" | bc)
	#dprofit=$(echo "$dtotal_value-$dcost" | bc)
	#dprofit_percentage=$(echo "($dtotal_value/$dcost)*100" | bc -l)
	
	##Jakes stuff
	#jcost=4500
	#jcoins=11504.66
	#jtotal_value=$(echo "$doge_coin_value*$jcoins" | bc)
	#jprofit=$(echo "$jtotal_value-$jcost" | bc)
	#jprofit_percentage=$(echo "($jtotal_value/$jcost)*100" | bc -l)
	
	#Total
	tcost=106.92
	tcoins=1748.7288
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
	echo "Profit Percentage: "`printf "%0.2f\n" $tprofit_percentage`"%"
	#echo
	#echo "Damo:"
	#echo "Total Cost: $"$dcost
	#echo "Total Profit: $"`printf "%0.2f\n" $dprofit`
	#echo "Profit Percentage: "`printf "%0.2f\n" $dprofit_percentage`"%"
	#echo
	#echo "Jake:"
	#echo "Total Cost: $"$jcost
	#echo "Total Profit: $"`printf "%0.2f\n" $jprofit`
	#echo "Profit Percentage: "`printf "%0.2f\n" $jprofit_percentage`"%"
	
	rm data
	sleep 5
done