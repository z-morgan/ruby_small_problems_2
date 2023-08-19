=begin
method takes an array of elements, and an integer, and passes successive, overlapping, 
integer-length sets of elements into the block. Presume, method returns original collection

input: array and integer
returns: array

- successive, overlapping means that the index of the first element passed into the block
shifts by 1 each iteration
- when the last element has been included in the sequence passed to the block, iteration ceases
- if the integer is greater than the size of the array, do not execute the block at all

A:
if integer is less than or equal to array size
  from zero to array's size minus integer:
    create a sub-array starting from index current-number
    of length integer
    yield the sub-array to the block
return the array
=end

def each_cons(arr, int)
  if int <= arr.size
    0.upto(arr.size - int) do |start_idx|
      yield(*arr[start_idx, int])
    end
  end
  arr
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