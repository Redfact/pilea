class GetValues
   attr_accessor :daily, :coin , :hourly

   def initialize(coin_name) 
      @daily = Hash.new
      @hourly = Hash.new
      @coin = coin_name
      
      @daily = history_daily
      @hourly  = history_hourly    
   end


   #Get all existing values of the current coin daily since today 
   def history_daily
      now = DateTime.now.strftime('%s')
      one_year_ago = 1.year.ago.strftime('%s')
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=max")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   #Get all existing values of the current coin from now to 3 months ago
   def history_hourly
      now = DateTime.now.strftime('%s')
      one_year_ago = 1.year.ago.strftime('%s')
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=90")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   def find_for_last_week(elements)
      elements_array = []
      elements_data = @data_hash[elements].last(7)
      elements_data.each{ |index|
         element =  index[1]
         elements_array << element
      }
      return elements_array
   end


   def timestamp_for_last_week
      timestamp_array = []
      data = @data_hash['prices'].last(7)
      data.each{ |index|
         timestamp_array << index[0]
      }
      return timestamp_array
   end

   def find_prices_each_months
      puts "Lancement de la méthode find_prices_each_months"
      # Méthode qui retourne les prix des 12 derniers mois du data_hash dans un array
   end

   def print_daily_values
      daily['prices'].each{ |index|
         date  = Time.at(index[0]/1000)
         price = index[1] 
         print "date :#{date} => #{price}\n"
      }
   end

   def print_hourly_values
      hourly['prices'].each{ |index|
         date  = Time.at(index[0]/1000)
         price = index[1] 
         print "date :#{date} => #{price}\n"
      }
   end
   

end

# Il faut récupérer le "prices" et le "total_volumes" une fois par mois pour la MVP
