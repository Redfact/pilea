class FillDatabase

  def by_interval_type(interval)
    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }
    all_coins = Coin.all
    all_coins.each { |coin|
      puts "Filling database with #{interval} values of '#{coin.name}'..."
      values = GetValues.new(coin.name).history(interval)
      SaveValues.new(coin.name, values, interval_equivalence_num[interval]).perform
      puts "...Done!"
    }
  end

end
