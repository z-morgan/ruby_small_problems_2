=begin
method takes an array, and passes each element into a block, while the block's return value is truthy. if the block returns
a falsy value, the current element and the remaining elements are returned as an array.

A: 
input array.size.times do the following:
  check and see if the first element causes the block to return a falsy value:
    if not, delete the first element and next 
    if so, return the array
return the array
=end

def drop_while(arr)
  new_arr = arr.dup
  arr.size.times do
    if yield(new_arr.first)
      new_arr.shift
    else
      return new_arr
    end
  end
  new_arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []