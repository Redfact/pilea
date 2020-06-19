namespace :crypto do
  desc "Use this task to create a new coin in the database from the terminal"
  task new: :environment do
    FillDatabase.new.add_new_coin
  end

  desc "Fill the database with daily values for all coins"
  task daily: :environment do
    FillDatabase.new.by_interval_type('daily')
  end

  desc "Fill the database with hourly values for all coins"
  task hourly: :environment do
    FillDatabase.new.by_interval_type('hourly')
  end

end
