=begin
build a array#zip method from scratch. 
- only takes two arrays
- the array have the same number of elements

A:
iterate through the indeces, and for each
  add the element at that index from each array to an array, 
  add the new array to a result array
return result array

=end

def zip(arr1, arr2)
  arr1.each_index.with_object([]) do |i, obj|
    obj << [arr1[i], arr2[i]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]