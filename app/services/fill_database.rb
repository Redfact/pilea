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
    current_coin = coin.name
    values = GetValues.new(current_coin).history(interval)
    SaveValues.new(@coin, interval, 2).perform
    hourly
  end

end
