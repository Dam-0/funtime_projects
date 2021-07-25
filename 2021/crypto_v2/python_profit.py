#!/bin/python3
from binance.client import Client
import time
import os

api_key = "x"
api_secret = "x"

client = Client(api_key, api_secret)

investors = {
    "John": {
        "price": x,
        "coins": x
    },
    "Carl": {
        "price": y,
        "coins": y
    }
}


multiple_investors = len(investors) > 1

while True:
    symbol_ticker = client.get_symbol_ticker(symbol="DOGEAUD")

    if multiple_investors:
        os.system("clear")

    for name, investor in investors.items():
        doge_price = float(symbol_ticker["price"])
        new_balance = round(doge_price * investor["coins"], 2)
        profit = round(new_balance - investor["price"], 2)
        profit_percent = round(profit / investor["price"] * 100, 2)

        if multiple_investors:
            print(name + ":")
            print(f"    Investment: {investor['price']}")
            print(f"    Current value: {new_balance}")
            print(f"    Profit: {profit} ({profit_percent}%)")
        else:
            print(f"{investor['price']} -> {new_balance} = {profit} ({profit_percent}%)")

    time.sleep(5)