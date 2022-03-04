data = File.new('./the_text.txt', 'r').to_a.join('')

puts data.class
puts data