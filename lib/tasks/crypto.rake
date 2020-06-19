namespace :crypto do
  desc "Use this task to create a new coin in the database from the terminal"
  task new: :environment do
    FillDatabase.new.add_new_coin
  end
end
