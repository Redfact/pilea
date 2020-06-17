class GetValues
   attr_accessor :daily, :coin , :hourly

   def initialize(coin_name) 
      @daily = Hash.new
      @hourly = Hash.new
      @coin = coin_name
      
      @daily = history_daily
      @hourly = history_hourly    
   end


   #Get all existing values of the current coin daily since forever 
   def history_daily
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin}/market_chart?vs_currency=usd&days=max")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   #Get all existing values of the current coin from now to 3 months ago
   def history_hourly
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin}/market_chart?vs_currency=usd&days=90")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   # Get all values per value type  (volumes,market cap,prices) in hash (daily or hourly)
   #Return 1 dimension array with the value type 
   def get_all_values(hash,value_type)
      array_res= []
      
      hash[value_type].each{ |index|
         array_res<<index[1]
      }
      return array_res 
   end

   # Work like 'get_all_values()' but return an array of timestamp 
   def get_time_of_values(hash)
      array_res= []
      hash['prices'].each{ |index|
         array_res<<index[0]
      }
      return array_res 
   end
 
end

