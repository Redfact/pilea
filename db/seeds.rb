coins = {
 "bitcoin"=>["BTC","https://s2.coinmarketcap.com/static/img/coins/32x32/1.png"],
 "ethereum"=>["ETH","https://s2.coinmarketcap.com/static/img/coins/32x32/1027.png"],
 "xrp"=>["XRP","https://s2.coinmarketcap.com/static/img/coins/32x32/52.png"],
 "bitcoin-cash"=>["BCH","https://s2.coinmarketcap.com/static/img/coins/32x32/1831.png"],
 "litecoin"=>["LTC","https://s2.coinmarketcap.com/static/img/coins/32x32/2.png"],
 "binancecoin"=>["BNB","https://s2.coinmarketcap.com/static/img/coins/32x32/1839.png"],
 "eos"=>["EOS","https://s2.coinmarketcap.com/static/img/coins/32x32/1765.png"],
 "cardano"=>["ADA","https://s2.coinmarketcap.com/static/img/coins/32x32/2010.png"],
 "monero"=>["XMR","https://s2.coinmarketcap.com/static/img/coins/32x32/328.png"],
 "tron"=>["TRX","https://s2.coinmarketcap.com/static/img/coins/32x32/1958.png"]
}

Coin.destroy_all

coins.each{ |key,value|
    Coin.create(name:key,symbol:value[0],logo:value[1])
}

