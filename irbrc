IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  puts 'No awesome_print :('
end
