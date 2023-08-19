require 'minitest/autorun'
#optional - require 'minitest/report'
#optional - 

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cashregister = CashRegister.new(100.0)
    @transaction = Transaction.new(25)
  end

  def test_accept_money
    @transaction.amount_paid = 30.0
    @cashregister.accept_money(@transaction)
    assert_equal(130.0, @cashregister.total_money)
  end

  def test_change
    @transaction.amount_paid = 30
    assert_equal(5, @cashregister.change(@transaction))
  end

  def test_give_receipt
    text = "You've paid $#{@transaction.item_cost}."
    assert_output(puts text) { @cashregister.give_receipt(@transaction) }
  end
end
