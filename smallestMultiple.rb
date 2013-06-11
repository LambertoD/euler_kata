require 'minitest/autorun'

class TestSmallestMultiple < MiniTest::Unit::TestCase
	def setup
		@smallest_multiple = SmallestMultiple.new
	end

	def test_number_is_divisible_by_number_1_to_10
		numbers_to_test = [2520, 5040, 25]
		numbers_to_test.each do |number|
			assert @smallest_multiple.is_multiple_of_numbers_1_to_10?(number),"number #{number} is NOT multiple"
		end	
	end

	def test_number_divisible_by_number_1_to_20
		
	end
end

class SmallestMultiple

	def is_multiple_of_numbers_1_to_10?(number)
		remainder = 0
		(1..10).each do |divisor|
			remainder += number % divisor
		end
		puts "remainder is #{remainder}"
		return true if remainder == 0 else return false
	end


end