require 'minitest/autorun'

class TestLargestProductInSeries < MiniTest::Unit::TestCase

	def setup
		@largest_product_in_series = LargestProductInSeries.new
		@number_text = File.read('input1000digits.txt')
	end 

	def test_read_file
		puts @number_text
	end

	def test_read_5_characters_from_text
		first_five_in_char = @number_text[0..4]
		puts "Here are first five characters from file : #{first_five_in_char}"
		first_five_in_int = first_five_in_char.to_i
		puts "Class of first_five_in_int is :", first_five_in_int.class
	end
end

class LargestProductInSeries

end