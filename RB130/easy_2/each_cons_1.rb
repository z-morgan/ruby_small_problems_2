=begin
method takes an array, and returns nil. It passes overlapping sequences of two elements at a time into the block.

A:
itertate from the first element to the second to last, and for each:
  pass the current element and the next element into the block as an array
return nil


=end

def each_cons(arr)
  unless arr.size < 2
    (0...arr.size - 1).each { |idx| yield([arr[idx], arr[idx + 1]]) }
  end
  nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil