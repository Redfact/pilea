desc "Task créée pour tester le Scheduler."
task test_task: :environment do
  puts 'Ceci est un message écris dans la task "test_task".'
  puts "Appel a une fonction rangée dans services :"
  test = TestService.new
  test.say_hello
  test_result = test.perform_get_data_hash
  puts "FIN DE LA TASK!"
end
