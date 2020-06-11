require 'get_values'

coins = {
 "bitcoin"=>["BTC","https://s2.coinmarketcap.com/static/img/coins/32x32/1.png"],
 "ethereum"=>["ETH","https://s2.coinmarketcap.com/static/img/coins/32x32/1027.png"],
 "ripple"=>["XRP","https://s2.coinmarketcap.com/static/img/coins/32x32/52.png"],
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
coins.each { |key,value|
    Coin.create(name:key, symbol:value[0], logo:value[1])
}


#max
def fill_values_in_database(coin)
    data = GetValues.new(coin.name)
    prices = data.find_for_last_week('prices')
    volumes = data.find_for_last_week('total_volumes')
    number_of_values = prices.length
  
    number_of_values.times { |i|
        Value.create(
            price: prices[i],
            volume: volumes[i].to_i,
            interval: 1,
            coin_id: coin.id)
    }
end
  
Coin.all.each { |coin|
    puts "Filling database with values of #{coin.name}..."
    fill_values_in_database(coin)
}

puts "Seeding is done !"

# Example how to get prices and volumes of the current_coin
# cur_coin.values.each{|index|
#     print "volume: #{index.volume} , price : #{index.price} \n"
# }
