require 'get_values'

coins = {
 "bitcoin"=>["btc","https://assets.coingecko.com/coins/images/1/large/bitcoin.png"],
 "ethereum"=>["eth","https://assets.coingecko.com/coins/images/279/large/ethereum.png"]
}

puts "Creating coins..." 
coins.each { |key,value|
    Coin.create(name:key, symbol:value[0], logo:value[1])
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

