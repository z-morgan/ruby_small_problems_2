items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |arg1, arg2, arg3|
  puts arg1
  puts arg2
  puts arg3
end

# # gather(items) do |a, *b|
# #   puts a
# #   puts b.join(', ')
# # end

# gather(items) do | a, b, c, d|
#   puts "#{a}, #{b}, #{c}, and #{d}"
# end
