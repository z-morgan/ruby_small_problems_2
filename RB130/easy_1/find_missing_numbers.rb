=begin
Write a method that takes a sorted array of integers as an argument, 
and returns an array that includes all of the missing integers 
(in order) between the first and last elements of the argument.

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

method takes a sorted array of integers, and returns a sorted array of the integers
between the first and last elements which are not in the input array.
input: arry of integers
return: array of integers
 
- array contains positive and negative integers
- if there are not missing elements, return empty array
- if there are less than two elements in the input array, return empty array.

A:
get a range from the first element in the input to the last.
for each element in the range, check if that element is in the input array.
  if not, add it to a new array, which the method returns.
=end

# def missing(input_arr)
#   (input_arr[0]...input_arr[-1]).each_with_object([]) do |num, arr| 
#     arr << num unless input_arr.include? num
#   end
# end

# def missing(input_arr)
#   result_arr = []
#   for num in input_arr[0]...input_arr[-1]
#     result_arr << num unless input_arr.include? num
#   end
#   result_arr
# end

def missing(input_arr)
  (input_arr.first...input_arr.last).to_a - input_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []