class FillDatabase
  attr_accessor :coin

  def initialize
    @coin = coin_name
  end

  def by_interval_type(interval)
    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }
    all_coins = Coin.all
    all_coins.each { |coin|
      values = GetValues.new(coin.name).history(interval)
      SaveValues.new(@coin, interval, 2).perform
    }
  end

end
