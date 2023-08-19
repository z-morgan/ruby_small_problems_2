require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(25)
    input = StringIO.new("30\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, transaction.amount_paid)
  end
end


# def prompt_for_payment(input: $stdin, output: $stdout)
#   loop do
#     output.puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     output.puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end
