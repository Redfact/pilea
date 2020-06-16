class GetValues
   attr_accessor :daily, :coin_name ,:coin ,:hourly

   def initialize(pcoin_name) 
      @daily = Hash.new
      @hourly = Hash.new
      @coin_name = pcoin_name
      @coin = Coin.find_by(name:pcoin_name)

      # Get all existing values if DB is empty
      # Or just get all new values if database is already filled
      if(!@coin.values.empty?)
            @daily = update_daily
            @hourly = update_hourly
         else
            @daily = history_daily
            @hourly  = history_hourly 
      end  

   end


   #Get all existing values of the current coin daily since today 
   def history_daily
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart?vs_currency=usd&days=max")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   #Get all existing values of the current coin from now to 3 months ago
   def history_hourly
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart?vs_currency=usd&days=90")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end


   # Return hash with new values from last update to now.
   # /!\ Granularity depends on how big the duration (between now and lastdate) of time is.
   # Every 1 min if within 1 days , hourly between 1 to 90 days and daily if above 90 days.
   # def update_hourly
   #    # lastdate = (coin.hourly.last.time/1000).to_s
   #    lastdate = "1592215236"
   #    now = DateTime.now.strftime('%s')

   #    # Get the duration in days 
   #    duration = ( DateTime.strptime(now,'%s') - DateTime.strptime(lastdate,'%s') ).to_i
   #    puts "duration:",duration

   #    if( duration < 2 )
   #       url="https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart?vs_currency=usd&days=2"
   #    else
   #       url="https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart/range?vs_currency=usd&from=#{lastdate}&to=#{now}"   
   #    end
   #    puts url 
   #    request=RestClient.get(url)
   #    return JSON.parse(request)
   # end

   # Return hash of last new values 
   def update_hourly
      lastimestmp = coin.values.last.time
      hourlyhash = history_hourly
      prices = hourlyhash['prices']
      return prices
   
   end
   

   def update_daily


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





