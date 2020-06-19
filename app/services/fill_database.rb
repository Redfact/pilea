class FillDatabase

  def by_interval_type(interval)

    interval_equivalence_num = {
      "minutely"=>0,
      "hourly"=>1,
      "daily"=>2,
    }

    all_coins = Coin.all

    puts "-"*100
    puts "Starting process to update all coins #{interval} values..."
    puts "-"*100
    sleep 3

    all_coins.each { |coin|
      if !coin.has_interval_values?(interval)
        puts "No existing #{interval} value for '#{coin.name}' !"
        sleep 1.5
        puts "Filling database for the first time..."
        sleep 1
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
    puts "All coins of the database have been updated with #{interval} values !"
  
  end

  def add_new_coin
    puts "*"*70
    puts "Please enter the name of the new coin : (example : 'bitcoin')"
    print "> "
    name = gets.chomp
    puts "Please enter the symbol of the new coin : (example : 'btc')"
    print "> "
    symbol = gets.chomp
    logo = name + ".png"
    puts name
    puts symbol
    puts logo
    Coin.create(name: name, symbol: symbol, logo: logo)
    puts "The coin named '#{name}'' is added to the database."
    sleep 1
    puts "Its logo must be named #{logo} and placed app/assets/images."
    puts "*"*70
  end

end
