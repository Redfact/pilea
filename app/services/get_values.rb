
class GetValues
   attr_accessor :coin_name ,:coin
   
   def initialize(pcoin_name) 
      @coin = pcoin_name
   end

   def last_daily_date
      Coin.find_by(name:@coin).daily.last.time
   end

   def last_hourly_date
      Coin.find_by(name:@coin).hourly.last.time
   end
   
   def coingecko_call(coin_name, days)
      RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart?vs_currency=usd&days=#{days}")
   end
   
   def history_daily
      JSON.parse(coingecko_call(@coin,'max'))
   end

   def history_hourly
      JSON.parse(coingecko_call(@coin,'90'))
   end

   # Value type => total_volumes,market_caps,prices
   def get_array_values(hash,value_type)
      hash[value_type].each_with_object([]) do |index, values|
         values << index[1]
      end
   end

   # Work like 'get_all_values()' but return an array of timestamp 
   def get_time_of_values(hash)
      hash['prices'].each_with_object([]) do |index, times|
         times<<index[0]
      end
   end

   # Get a sub array of values from last database date to most recent date 
   def get_sub_array(array,lastime)
      array = array.reverse()
      iter=0
      array.each do |elem|
         deltatime = elem[0] - lastime
            if( deltatime < 0 )  
               break
            else
               iter +=1 
            end
      end 
      array.first(iter).reverse()
   end

   def update_hourly
      hourly = JSON.parse(coingecko_call(@coin,'90'))
      hourly['prices']=get_sub_array(hourly['prices'],last_hourly_date)
      hourly['market_caps']=get_sub_array(hourly['market_caps'],last_hourly_date)
      hourly['total_volumes']=get_sub_array(hourly['total_volumes'],last_hourly_date)
      hourly
   end 

   def update_daily
      daily = JSON.parse(coingecko_call(@coin,'max'))
      daily['prices']=get_sub_array(daily['prices'],last_hourly_date)
      daily['market_caps']=get_sub_array(daily['market_caps'],last_hourly_date)
      daily['total_volumes']=get_sub_array(daily['total_volumes'],last_hourly_date)
      daily
   end

end





