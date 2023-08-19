=begin
method args: start, end, step value
method first passes the start value into the block
then it passes the previous value plus the step into the block on every 
successive iteration until the value would be greater than the end value
method returns a range from start to end.

A:
set value to start
loop until value > end
  pass value to block
  increment value by step
end
return (start..end)
=end

def step(start_num, end_num, step)
  value = start_num
  until value > end_num
    yield(value)
    value += step
  end
  (start_num..end_num)
end

p step(1, 10, 3) { |value| puts "value = #{value}" }