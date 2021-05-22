#pip3 install binance-python

from binance.client import Client
api_key="x"		#Replace this with your own
api_secret="x"	#Replace this with your own
client = Client(api_key, api_secret)


File = open("data", "w")

doge_price = client.get_symbol_ticker(symbol="DOGEAUD")
File.write(doge_price["price"] + "\n")


coin_amount = (client.get_asset_balance(asset='DOGE'))
File.write(coin_amount["free"] + "\n")

#total = 0
#order = client.get_my_trades(symbol='DOGEAUD')
#for key in order:
#	if key["isBuyer"] == True:
#		sum = (float(key["quoteQty"]) + float(key["commission"]) )
#		total = sum + total
#		File.write(str(total) + "\n")

File.close()
