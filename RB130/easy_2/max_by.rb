=begin
method takes an array, and returns the element which causes the block to return the highest value.

A:
initialize a variable to store the high element
initialize a variable to store the highest return value
iterate through the array, and for each:
  pass the element into the block
  if the return value is higher than the highest return:
    reassign the high element and the highest return
return the highest element.

=end

def max_by(arr)
  return nil if arr.empty?
  high_element = arr[0]
  highest_return = yield(high_element)
  
  arr.each do |el|
    block_returned = yield(el)
    if block_returned > highest_return
      high_element = el
      highest_return = block_returned
    end
  end
  high_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
