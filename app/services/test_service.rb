class TestService

  def say_hello
    puts "Hello ! Cette ligne est écrite dans la méthode say_hello du service TestService"
  end

  def perform_get_data_hash
    puts "Méthode perform_get_data_hash"
    result = GetValues.new('bitcoin').get_data_hash
    puts result
    puts result.length
    puts "Fin de la méthode perform_get_data_hash"
    return result
  end

end
