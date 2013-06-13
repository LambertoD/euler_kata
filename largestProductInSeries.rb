require 'minitest/autorun'
require 'stringio'

class TestLargestProductInSeries < MiniTest::Unit::TestCase

  def setup
    @largest_product_in_series = LargestProductInSeries.new
    raw_text = File.read('input1000digits.txt')
    @number_text = raw_text.gsub(/\n/,"")
  end 

  def test_read_file_using_stringio
    str = StringIO.new(@number_text)
    line = str.gets
    puts line 
  end

  def test_read_file_via_file_read
    puts
    puts @number_text
    puts "lenght of text is: #{@number_text.length}"
  end

  def test_read_5_characters_using_array_slice
    first_five_in_char = @number_text[0..4]
    first_five_in_int = first_five_in_char.to_i
    assert_equal 73167, first_five_in_int
    assert_equal "73167", first_five_in_char
  end

  # def test_reading_5_characters_using_stringio
  #   five_chars = @str.read(5)
  #   assert_equal "73167",five_chars
  # end

  def test_loading_chars_to_array

    assert_equal 0, @largest_product_in_series.extract_numbers_from_file_into_array
  end

  # def test_reading_1_char_at_a_time_until_eof
  #   position = 0
  #   while @str.eof? == false
  #     @str.pos = position
  #     five_chars = @str.read(5)
  #     puts five_chars
  #     position += 1
  #   end
  # end
end

class LargestProductInSeries
  attr_accessible :product_array

  def initiallze
    @five_digit_numbers_array = []
  end

  def extract_numbers_from_file_into_array

    index = 0
    while index < @number_text.length - 4
      five_digit_num = @number_text[index..index+4]
      @five_digit_numbers_array << five_digit_num
      # puts "five digit number is : #{five_digit_num}"
      index += 1
    end
  end

  def get_products_for_digits
    products_array = []
    @five_digit_numbers_array.each  do |n|
      n.split('')
    end  
  end

end