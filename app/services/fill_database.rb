class FillDatabase

  def by_interval_type(interval)
    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }
    all_coins = Coin.all
    all_coins.each { |coin|
      if coin.values.empty?
        puts "No existing #{interval} value for '#{coin.name}' ! Filling database for the first time'..."
        sleep 1
        values = GetValues.new(coin.name).history(interval)
      else
        puts "Updating database with #{interval} values of '#{coin.name}'..."
        sleep 1
        values = GetValues.new(coin.name).update(interval)
      end
        SaveValues.new(coin.name, values, interval_equivalence_num[interval]).perform
      puts "...Done!"
    }
  end

end
