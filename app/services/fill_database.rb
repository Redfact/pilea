class FillDatabase

  def by_interval_type(interval)
    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }
    all_coins = Coin.all
    puts "-"*100
    puts "Starting to update all coins #{interval} values..."
    all_coins.each { |coin|
      if coin.values.empty?
        puts "No existing #{interval} value for '#{coin.name}' !"
        puts "Filling database for the first time..."
        sleep 2
        values = GetValues.new(coin.name).history(interval)
      else
        puts "Updating database with #{interval} values of '#{coin.name}'..."
        sleep 1
        values = GetValues.new(coin.name).update(interval)
      end
        SaveValues.new(coin.name, values, interval_equivalence_num[interval]).perform
      sleep 0.5
    }
    puts "-"*100
    puts "The database has been updated with #{interval} value for all coins."
  end

end
