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

  def test_get_product_of_5_digits
    test_string = '23456'
    assert_equal 720, @largest_product_in_series.get_product_for_digits(test_string)
  end

  def test_array_of_products_size
    @largest_product_in_series.extract_numbers_from_file_into_array(@number_text)
    assert_equal 996, @largest_product_in_series.products_array.length
    assert_equal 996, @largest_product_in_series.products_array.size  
  end

  def test_greatest_product_in_series
    @largest_product_in_series.extract_numbers_from_file_into_array(@number_text)
    assert_equal 40824,  @largest_product_in_series.greatest_product_in_collection
  end
end

class LargestProductInSeries
  attr_reader :products_array

  def initialize
    @products_array = []
  end

  def extract_numbers_from_file_into_array(string_of_numbers)

    index = 0
    while index < string_of_numbers.length - 4
      five_digit_extract = string_of_numbers[index..index+4]
      @products_array << get_product_for_digits(five_digit_extract)
      # puts "five digit number is : #{five_digit_num}"
      index += 1
    end
  end

  def get_product_for_digits(digits)
    product = 1
    digits.each_char  do |n|
      product *= n.to_i
    end  
    product
  end

  def greatest_product_in_collection
    @products_array.max
  end

end