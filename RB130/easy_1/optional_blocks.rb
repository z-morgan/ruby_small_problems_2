# def compute
#   return 'Does not compute.' unless block_given?
#   yield
# end

# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

def compute(num)
  return 'Does not compute' unless block_given?
  yield(num)
end

var = 2
puts compute(4) { |n| n + var } == 6

var = 'b'
puts compute('a') { |n| n + var } == 'ab'
puts compute('a') == 'Does not compute'

