=begin
using my solution form RB101/medium2/bubble_sort.rb
=end

# def bubble_sort!(arr)
#   loop do
#     swap = false
#     0.upto(arr.size - 2) do |start|
#       if block_given?
#         sort_op = yield(arr[start], arr[start + 1])
#       else
#         sort_op = arr[start] < arr[start + 1]
#       end

#       if sort_op == false
#         arr[start], arr[start + 1] = arr[start + 1], arr[start]
#         swap = true
#       end
#     end
#     break if swap == false
#   end
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

def bubble_sort!(arr)
  trans_arr = arr.map { |element| yield(element) } if block_given?

  loop do
    swap = false
    0.upto(arr.size - 2) do |start|
      sort_op = trans_arr[start] < trans_arr[start + 1]

      if sort_op == false
        arr[start], arr[start + 1] = arr[start + 1], arr[start]
        trans_arr[start], trans_arr[start + 1] = trans_arr[start + 1], trans_arr[start]
        swap = true
      end
    end
    break if swap == false
  end
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)