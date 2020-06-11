class GetValues
   attr_accessor :data_hash,:coin 

   def initialize(coin_name)
      @data_hash = Hash.new
      @coin = coin_name
      get_data_hash(@coin)
   end

   def get_data_hash(coin_name)
      # Call API qui récupère l'historique du 10 Juin 2019 au 10 Juin 2020
      # TimeStamp 10 Juin 2019 00h00 : 1560124800
      # TimeStamp 10 Juin 2020 00h00 : 1591747200
      coin_name = 'bitcoin'
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart/range?vs_currency=usd&from=1560124800&to=1591747200")
      @data_hash = JSON.parse(response)
      return @data_hash
   end

   def find_prices_for_last_week
      puts "Lancement de la méthode find_prices_for_last_week"
      # Méthode qui retourne les prix des 7 derniers jours du data_hash dans un array
      prices_array = []
      prices_data = @data_hash['prices'].last(7)
      prices_data.each{ |index|
         timestamp =  index[0]
         price =  index[1]
         prices_array << price
      }
      puts prices_array
   end

   def find_prices_each_months
      puts "Lancement de la méthode find_prices_each_months"
      # Méthode qui retourne les prix des 12 derniers mois du data_hash dans un array
   end

end

# Il faut récupérer le "prices" et le "total_volumes" une fois par mois pour la MVP
