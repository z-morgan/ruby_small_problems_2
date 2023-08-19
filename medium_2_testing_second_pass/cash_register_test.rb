require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
  end

  def test_accept_money
    @transaction.amount_paid = 30

    @register.accept_money(@transaction)
    assert_equal(130, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 30
    change = @register.change(@transaction)

    assert_equal(5, change)
  end

  def test_give_receipt
    assert_output("You've paid $25.\n") { @register.give_receipt(@transaction) }
  end

  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal 30, @transaction.amount_paid
  end
end

# def prompt_for_payment(input: $stdin)
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end

