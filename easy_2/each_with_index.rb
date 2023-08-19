=begin
=end

def each_with_index(array)
  idx = 0
  array.each do |el| 
  yield(el, idx)
  idx += 1
  end
end



result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]