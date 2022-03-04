=begin
method takes an array and an integer (n) as arguments, and returns nil. iterates through the array, passing n-length overlapping sequences into the block.
- stops iterating when the last element is included in the sequence passed to the block.

A:
(array_size) - n # gives the last index to iterate over
iterate from index 0 to (array_size) - n , and for each index:
  pass the array of elements from index to index + n into the block, with a splat in front
return nil
=end

def each_cons(arr, n)
unless arr.size < n
  0.upto(arr.size - n) { |idx| yield(*arr[idx, n]) }
end
nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}