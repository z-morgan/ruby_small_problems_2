=begin
Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false


method takes an array as an argument. If the array is empty, it returns nil. Otherwise, it passes each successive element into
a block, and returns true if any of these elements cause the block to return true. (bonus: if block returns truthy value)

- array can contain any class of object as elements
- method stops iterating through the array as soon as an elements causes the block to return true

A:
return nil if the array is empty
iterate through the array, and for each element:
  yield element to the block, and capture the return value in a variable
  return true if the block returns true
return false

=end

# def any?(arr)
#   arr.each do |el|
#     return true if yield(el) == true
#   end
#   false
# end

## bonus: returns true if any element causes the block to return truthy value.
def any?(arr)
  arr.each do |el|
    return true if !!yield(el) == true
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value } == true #-> true

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false