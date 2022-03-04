require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @words = File.new('./the_text.txt').to_a.join
    @the_text_object = Text.new(@words.dup)
  end

  def test_swap
    assert_equal(@words.gsub('a', 'e'), @the_text_object.swap("a", "e"))
  end

  def teardown
    File.close('./the_text.txt')
  end
end


# I guess... give test swap method another go. it's stupid hard.