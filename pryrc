begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
  puts 'No awesome_print :('
end
