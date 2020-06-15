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
User.destroy_all

#Import coins in database 
coins.each { |key,value|
    Coin.create(name:key, symbol:value[0], logo:value[1])
}

def Add_daily_values(coin,data)
    daily     = data.daily
    prices    = data.get_all_values(daily,'prices')
    volumes   = data.get_all_values(daily,'total_volumes')
    marketcap = data.get_all_values(daily,'market_caps')
    times     = data.get_time_of_values(daily)
    number_of_values = prices.length

    number_of_values.times { |i|
        Value.create(
            coin_id: coin.id,
            price: prices[i],
            volume: volumes[i].to_i,
            market_cap: marketcap[i],
            interval: 2,
            time: times[i]
        )
    }
end

def Add_hourly_values(coin,data)
    hourly    = data.hourly
    prices    = data.get_all_values(hourly,'prices')
    volumes   = data.get_all_values(hourly,'total_volumes')
    marketcap = data.get_all_values(hourly,'market_caps')
    times     = data.get_time_of_values(hourly)
    number_of_values = prices.length

    number_of_values.times { |i|
        Value.create(
            coin_id: coin.id,
            price: prices[i],
            volume: volumes[i].to_i,
            market_cap: marketcap[i],
            interval: 1,
            time: times[i]
        )
    }
end

  
Coin.all.each { |coin|
    puts "Filling database with values of #{coin.name}..."
    data = GetValues.new(coin.name)
    Add_hourly_values(coin,data)
    Add_daily_values(coin,data)
}

puts "Creating admin account..."
User.create(
  first_name: "Metis",
  last_name: "Lab",
  email: "metislab201@gmail.com",
  password: "Metislab2016064",
  admin: true
  )

puts "Seeding is done !"

# Example how to get prices and volumes of the current_coin
# cur_coin.values.each{|index|
#     print "volume: #{index.volume} , price : #{index.price} \n"
# }
