class FillDatabase

  def by_interval_type(interval)
    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }
    all_coins = Coin.all
    all_coins.each { |coin|
      values = GetValues.new(coin.name).history(interval)
      puts coin.name
      puts interval
      puts interval_equivalence_num[interval]
      SaveValues.new(coin.name, values, interval_equivalence_num[interval]).perform
      puts "SaveValues exécuté"
    }
  end

end
