=begin
create an enumerator object that can iterate over an infinite list of factorials.

test it by iterating over the first 7 factorials, startin with zero. 
print these using an external iterator, then see what happens when you print 3 more factorials

reset the enumerator using the rewind method, then print 7 more factorials.

=end

fact = Enumerator.new do |list|
  list << 1
  a = 1

  fact_arr = [1]
  count = 1
  loop do
    fact_arr.push(count)
    a = fact_arr.reduce(:*)
    list << a
    count += 1
  end
end


# External iterators

6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="
fact.rewind
6.times { |number| puts "#{number}! == #{fact.next}" }
puts "=========================="

# Internal iterators

fact.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
