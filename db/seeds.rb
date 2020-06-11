require 'get_values'

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
Value.destroy_all

#All existing coin 
coins.each{ |key,value|
    Coin.create(name:key,symbol:value[0],logo:value[1])
}

#Fill the table  Values for bitcoin (first value) 
cur_coin = Coin.first
data = GetValues.new(cur_coin.name)
bt_prices = data.find_for_last_week('prices')
bt_volumes = data.find_for_last_week('total_volumes')
 
for i in 0..bt_volumes.size-1
    Value.create(price: bt_prices[i] , volume:bt_volumes[i].to_i , interval:2,coin_id:cur_coin.id)
end

# Example how to get prices and volumes of the current_coin
cur_coin.values.each{|index|
    print "volume: #{index.volume} , price : #{index.price} \n"
}



