desc "Task créé pour tester le Scheduler."
task test_task: :environment do
  puts 'Ceci est un message écris dans la task "test_task".'
  print_a_message
end