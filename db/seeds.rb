# Create Database

coins = {
  "bitcoin"=>["btc","bitcoin.png"],
  "ethereum"=>["eth","ethereum.png"],
  "ripple"=>["xrp","ripple.png"],
  "litecoin"=>["ltc","litecoin.png"],
  "binancecoin"=>["bnb","binancecoin.png"],
  "eos"=>["eos","eos.png"],
  "cardano"=>["ada","cardano.png"],
  "tezos"=>["xtz","tezos.png"],
  "stellar"=>["xlm","stellar.png"],
  "monero"=>["xmr","monero.png"],
  "tron"=>["trx","tron.png"],
  "neo"=>["neo","neo.png"],
  "dash"=>["dash","dash.png"],
  "iota"=>["miota","iota.png"],
  "cosmos"=>["atom","cosmos.png"],
  # "zcash"=>["zec","zcash.png"],
  # "vechain"=>["vet","vechain.png"],
  # "nem"=>["xem","nem.png"],
  # "ontology"=>["ont","ontology.png"],
  # "dogecoin"=>["doge","dogecoin.png"],
  # "digibyte"=>["dgb","digibyte.png"],
  # "zilliqa"=>["zil","zilliqa.png"],
  # "decred"=>["dcr","decred.png"],
  # "algorand"=>["algo","algorand.png"],
  # "icon"=>["icx","icon.png"],
  # "qtum"=>["qtum","qtum.png"],
  # "lisk"=>["lsk","lisk.png"],
  # "verge"=>["xvg","verge.png"],
  # "nano"=>["nano","nano.png"],
  # "waves"=>["waves","waves.png"]
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
