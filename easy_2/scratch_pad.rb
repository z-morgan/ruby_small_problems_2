# def method(a, b, c)
#   p a
#   p b
#   p c
# end        

# method([1, 2, 3])  # raises ArgumentError (1 given, expected 3)


# [1, 2, 3].tap do |a, b, c| # Object#tap passes the caller into the block
#   p a
#   p b
#   p c
# end           #=> each block parameter gets assigned to an element

=begin
I am noticing a small difference in how methods and blocks take arguments, when it comes to arrays. The following code does what I would expect, line 7 
raises an exception becuase only one argument is passed to a method that takes three. 

Since blocks have lenient arity, I would expect that with the following code, the array would be assigned to the first block local variable, and the other two would be assigned to nil. 
This is not what happens though. Instead, each element in the array is assigned to one of the block local variables. So far, 
I have only been able to reproduce this behavior when passing Array objects into a block. I have not been able to find an explaination for this behavior in the 
documentation. Does anyone know the explaination for why this occurs?
=end

def method(array)
  yield(array)
end

method([1, 2, 3]) do |a, b, c|  # each block local variable gets assigned to an element in the array
  p a                           # => 1
  p b                           # => 2
  p c                           # => 3
end   