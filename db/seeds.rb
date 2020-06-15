require 'get_values'

coins = {
 "bitcoin"=>["btc","https://assets.coingecko.com/coins/images/1/large/bitcoin.png"],
 "ethereum"=>["eth","https://assets.coingecko.com/coins/images/279/large/ethereum.png"],
 "ripple"=>["xrp","https://assets.coingecko.com/coins/images/44/large/xrp.png"],
 "litecoin"=>["ltc","https://assets.coingecko.com/coins/images/2/large/litecoin.png"],
 "binancecoin"=>["bnb","https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png"],
 "eos"=>["eos","https://assets.coingecko.com/coins/images/738/large/eos-eos-logo.png"],
 "cardano"=>["ada","https://assets.coingecko.com/coins/images/975/large/cardano.png"],
 "tezos"=>["xtz","https://assets.coingecko.com/coins/images/976/large/Tezos-logo.png"],
 "stellar"=>["xlm","https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png"],
 "monero"=>["xmr","https://assets.coingecko.com/coins/images/69/large/monero_logo.png"],
 "tron"=>["trx","https://assets.coingecko.com/coins/images/1094/large/tron-logo.png"],
 "neo"=>["neo","https://assets.coingecko.com/coins/images/480/large/neo.png"],
 "dash"=>["dash","https://assets.coingecko.com/coins/images/19/large/dash-logo.png"],
 "iota"=>["miota","https://assets.coingecko.com/coins/images/692/large/IOTA_Logo.png"],
 "cosmos"=>["atom","https://assets.coingecko.com/coins/images/1481/large/cosmos_hub.png"],
 "zcash"=>["zec","https://assets.coingecko.com/coins/images/486/large/circle-zcash-color.png"],
 "vechain"=>["vet","https://assets.coingecko.com/coins/images/1167/large/VeChain-Logo-768x725.png"],
 "nem"=>["xem","https://assets.coingecko.com/coins/images/242/large/nem.png"],
 "ontology"=>["ont","https://assets.coingecko.com/coins/images/3447/large/ONT.png"],
 "dogecoin"=>["doge","https://assets.coingecko.com/coins/images/5/large/dogecoin.png"],
 "digibyte"=>["dgb","https://assets.coingecko.com/coins/images/63/large/digibyte.png"],
 "zilliqa"=>["zil","https://assets.coingecko.com/coins/images/2687/large/Zilliqa-logo.png"],
 "decred"=>["dcr","https://assets.coingecko.com/coins/images/329/large/decred.png"],
 "algorand"=>["algo","https://assets.coingecko.com/coins/images/4380/large/download.png"],
 "icon"=>["icx","https://assets.coingecko.com/coins/images/1060/large/icon-icx-logo.png"],
 "qtum"=>["qtum","https://assets.coingecko.com/coins/images/684/large/qtum.png"],
 "lisk"=>["lsk","https://assets.coingecko.com/coins/images/385/large/Lisk_Symbol_-_Blue.png"],
 "verge"=>["xvg","https://assets.coingecko.com/coins/images/203/large/verge-symbol-color_logo.png"],
 "nano"=>["nano","https://assets.coingecko.com/coins/images/756/large/nano-coin-logo.png"],
 "waves"=>["waves","https://assets.coingecko.com/coins/images/425/large/waves.png"]
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
