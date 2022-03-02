=begin
returns true when exactly one element in collection causes the block to return truthy value
stops iterating and returns false if a second element causes the block to return true.
=end

def one?(collection)
  truthy_returns = 0
  collection.each do |element|
    truthy_returns += 1 if yield(element) 
    return false if (truthy_returns > 1)
  end
  truthy_returns == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false