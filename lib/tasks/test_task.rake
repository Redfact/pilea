desc "Task créé pour tester le Scheduler."
task test_task: :environment do
  puts 'Ceci est un message écris dans la task "test_task".'
  # Ajouter un appel a une fonction rangée dans services
end