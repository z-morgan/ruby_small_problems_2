require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('the_text.txt', 'rt')
    @text_obj = Text.new(@file.read)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

  def test_swap
    swap_result = @text_obj.swap('a', 'e')
    expecting = <<~TEXT.chomp
      Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
      Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
      quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
      nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
      dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
      et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expecting, swap_result)
  end

  def test_word_count
    assert_equal(72, @text_obj.word_count)
  end
end


# def swap(letter_one, letter_two)
#   @text.gsub(letter_one, letter_two)
# end