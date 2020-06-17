
class GetValues
   attr_accessor :coin
   
   def initialize(coin_name) 
      @coin = coin_name
   end

   def last_dates(duration)
      case duration
         when "daily"
            Coin.find_by(name:@coin).daily.last.time
         when "hourly"
            Coin.find_by(name:@coin).hourly.last.time    
      end
   end
   
   def coingecko_call(coin_name, days)
      RestClient.get("https://api.coingecko.com/api/v3/coins/#{coin_name}/market_chart?vs_currency=usd&days=#{days}")
   end

   def history(duration)
      case duration
         when "daily"
            JSON.parse(coingecko_call(@coin,'max'))
         when "hourly"
            JSON.parse(coingecko_call(@coin,'90'))
         else
            puts "Chose valide duration (ex: 'daily' , 'hourly' ..."     
      end
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
            if( deltatime <=
                0 )  
               break
            else
               iter +=1 
            end
      end 
      array.first(iter).reverse()
   end

   def update(duration)
      case duration
         when "daily"
            new_data=JSON.parse(coingecko_call(@coin,'max'))
         when "hourly"
            new_data=JSON.parse(coingecko_call(@coin,'90'))
         else
            puts "Chose valide duration (ex: 'daily' , 'hourly' ..."     
      end
      new_data['prices']=get_sub_array(new_data['prices'],last_dates(duration))
      new_data['market_caps']=get_sub_array(new_data['market_caps'],last_dates(duration))
      new_data['total_volumes']=get_sub_array(new_data['total_volumes'],last_dates(duration))
      new_data
   end

end





