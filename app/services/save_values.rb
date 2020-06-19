class SaveValues
  attr_accessor :coin,:history,:interval

  def initialize(coin_name, history, interval)
    @coin = coin_name
    @history = history
    @interval = interval
  end

  def perform
    coin_ID = Coin.find_by(name:@coin).id
      if (history['prices'].empty?)
          puts "No values added !"
      else
          @history['prices'].each_with_index do |price, index|
              Value.create(
              coin_id: coin_ID,
              price: price[1],
              volume: @history['total_volumes'][index][1].to_i,
              market_cap: @history['market_caps'][index][1],
              interval: @interval,
              time: price[0],
              )
          end
          puts "New values added for '#{@coin}' !"
      end
  end

end
