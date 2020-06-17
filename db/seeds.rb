require 'get_values'

coins = {
  "bitcoin"=>["btc","https://assets.coingecko.com/coins/images/1/large/bitcoin.png"],
  "ethereum"=>["eth","https://assets.coingecko.com/coins/images/279/large/ethereum.png"],
  "ripple"=>["xrp","https://assets.coingecko.com/coins/images/44/large/xrp.png"],
  "litecoin"=>["ltc","https://assets.coingecko.com/coins/images/2/large/litecoin.png"]
}

puts "Cleaning database..."
Coin.destroy_all
Value.destroy_all
User.destroy_all

puts "Creating coins..." 
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
