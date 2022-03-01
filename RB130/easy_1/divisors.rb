=begin
Write a method that returns a list of all of the divisors of the 
positive integer passed in as an argument. 
The return value can be in any sequence you wish.

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

A:
create an empty array
iterate from 0 to the input integer and for each
  if the input integer can be divided by the number with a remainder of zero, 
  add the number to the array.
return the array

=end

def divisors(int)
  1.upto((int.to_f / 2).ceil).select { |num| int % num == 0 }.push(int)
end

p divisors(1) == [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

