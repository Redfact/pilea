
class GetValues
   attr_accessor :daily, :coin_name ,:coin ,:hourly,:lastDateDaily,:lastDateHourly

   def initialize(pcoin_name) 
      @daily = Hash.new
      @hourly = Hash.new
      @coin_name = pcoin_name
      @coin = Coin.find_by(name:pcoin_name)

      # Get all existing values if DB is empty
      # Or just get all new values if database is already filled
      if(!@coin.values.empty?)
         @lastDateDaily =  @coin.daily.last.time
         @lastDateHourly = @coin.hourly.last.time
         @hourly = update_hourly
         @daily = update_daily
         puts "We have #{@daily['prices'].size -1} new value(s) in daily for #{@coin_name} "
         puts "We have #{@hourly['prices'].size -1} new value(s) in hourly for #{@coin_name} "
      else
            @daily = history_daily
            @hourly  = history_hourly 
      end  

   end


   #Get all existing values of the current coin daily since today 
   def history_daily
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{@coin_name}/market_chart?vs_currency=usd&days=max")
      tmp_hash = JSON.parse(response)
      return tmp_hash
   end

   #Get all existing values of the current coin from now to 3 months ago
   def history_hourly
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{@coin_name}/market_chart?vs_currency=usd&days=90")
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

   # Get a sub array of values from last database date to most recent date 
   # Return 1 dimension array of values
   def get_sub_array(array,lastime)

      #Reduce the number of iteration if we iterate from the end
      array = array.reverse()
      # count the number of iteration 
      iter=0
      array.each do |elem|
         #duration between the last date (in DB) and the new date readed
         deltatime = elem[0] - lastime
            if( deltatime < 0 )  
               break
            else
               iter +=1 
            end
      end 
      return array.first(iter).reverse()
   end

   # Return hash of last new values hourly 
   def update_hourly
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{@coin_name}/market_chart?vs_currency=usd&days=90")
      hourly = JSON.parse(response)
      hourly['prices']=get_sub_array(hourly['prices'],@lastDateHourly)
      hourly['market_caps']=get_sub_array(hourly['market_caps'],@lastDateHourly)
      hourly['total_volumes']=get_sub_array(hourly['total_volumes'],@lastDateHourly)
      return hourly ; 
   end 

   # Return hash of last new values hourly 
   def update_daily
      # TODO : Change max when the worker will be setted up 
      response = RestClient.get("https://api.coingecko.com/api/v3/coins/#{@coin_name}/market_chart?vs_currency=usd&days=max")
      daily = JSON.parse(response)
      daily['prices']=get_sub_array(daily['prices'],@lastDateDaily)
      daily['market_caps']=get_sub_array(daily['market_caps'],@lastDateDaily)
      daily['total_volumes']=get_sub_array(daily['total_volumes'],@lastDateDaily)
      return daily ; 
   end

end





