namespace :crypto do
  desc "Fill the database with daily values for all coins"
  task daily: :environment do
    FillDatabase.new.by_interval_type('daily')
  end

  desc "Fill the database with hourly values for all coins"
  task hourly: :environment do
    FillDatabase.new.by_interval_type('hourly')
  end

end
