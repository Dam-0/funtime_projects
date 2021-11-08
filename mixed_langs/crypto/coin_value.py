#pip3 install cryptocompare

import cryptocompare

price = (cryptocompare.get_price('DOGE', currency='AUD', full=False))
print(price["DOGE"]["AUD"])