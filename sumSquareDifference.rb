require 'minitest/autorun'

class TestSumSquareDifference < MiniTest::Unit::TestCase
  def setup
    @sum_square_diff = SumSquareDifference.new
  end

  def test_sum_of_squares_for_numbers_1_to_10
  	assert_equal 385, @sum_square_diff.sum_of_squares(1,10)
  end

  def test_square_of_sum_for_numbers_1_to_10
  	assert_equal 3025, @sum_square_diff.square_of_sums(1,10)
  end

  def test_difference_between_sum_of_squares_and_square_of_sums_for_10_numbers
  	diff = @sum_square_diff.square_of_sums(1,10) - @sum_square_diff.sum_of_squares(1,10)
  	assert_equal 2640, diff
  end

  def test_sum_of_squares_for_numbers_1_to_100
  	assert_equal 338350, @sum_square_diff.sum_of_squares(1,100)
  end

  def test_square_of_sum_for_numbers_1_to_100
  	assert_equal 25502500, @sum_square_diff.square_of_sums(1,100)
  end

  def test_difference_between_sum_of_squares_and_square_of_sums_for_100_numbers
  	diff = @sum_square_diff.square_of_sums(1,100) - @sum_square_diff.sum_of_squares(1,100)
  	assert_equal 0, diff
  end

end

class SumSquareDifference

	def sum_of_squares(start_num, end_num)
		(start_num..end_num).inject(0) { |sum, number| sum += number*number }
	end

	def square_of_sums(start_num, end_num)
		sum_of_numbers = (start_num..end_num).inject(0) { |sum, number| sum += number }
		sum_of_numbers * sum_of_numbers
	end

end
