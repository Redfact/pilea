namespace :crypto do
  desc "Task pour remplir la database la première fois"
  task fill_db: :environment do
    puts "Ici ce sera le code pour remplir la DB la première fois"
  end

  desc "Task pour update la database en daily values"
  task daily_update: :environment do
    puts "Ici ce sera le code pour update la DB avec les daily values"
  end

end
