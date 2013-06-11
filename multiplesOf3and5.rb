require 'minitest/autorun'

class TestMultiplesOf3and5 < MiniTest::Unit::TestCase
	def setup
		@multiplesOf3and5 = MuptiplesOf3and5.new
	end

	def test_sum_of_multiples_for_numbers_below_10
		numbers_below = 10
		assert_equal 23, @multiplesOf3and5.total_of_multiples_for(numbers_below)
	end

	def test_sum_of_multiples_for_numbers_below_100
		numbers_below = 100
		assert_equal 2318, @multiplesOf3and5.total_of_multiples_for(numbers_below)
	end

	def test_number6_is_multiple_of_3
		number = 6
		assert_equal true, @multiplesOf3and5.number_is_a_multiple_of_3_or_5?(number)
	end

	def test_number5_is_multiple_of_5
		number = 5
		assert_equal true, @multiplesOf3and5.number_is_a_multiple_of_3_or_5?(number)
  end		

	def test_number7_is_not_a_multiple_of_3_or_5
		number = 7
		assert_equal false, @multiplesOf3and5.number_is_a_multiple_of_3_or_5?(number)
  end		

end

class MuptiplesOf3and5

	def total_of_multiples_for(numbers_below)
		sum_of_multiples = 0
		(1...numbers_below).each do |number|
			if number_is_a_multiple_of_3_or_5?(number)			
				sum_of_multiples += number
		  end
		end		
		sum_of_multiples
	end

	def number_is_a_multiple_of_3_or_5?(number)
		if number % 3 == 0 || number % 5 == 0
			true
		else
			false
		end
	end


end