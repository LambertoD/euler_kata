require 'minitest/autorun'

class TestSmallestMultiple < MiniTest::Unit::TestCase
  def setup
    @smallest_multiple = SmallestMultiple.new
  end

  def test_number_is_divisible_by_number_1_to_10
    numbers_to_test = [2520, 5040]
    numbers_to_test.each do |number|
      assert @smallest_multiple.is_multiple_of_numbers_1_to_10?(number),"number #{number} is NOT multiple"
    end 
  end

  def test_number_divisible_by_number_1_to_20
    
  end

  def test_multiple_of_two_numbers
    assert_equal 6, @smallest_multiple.multiple_of_two_numbers(2,3)  
  end

  def test_get_common_multiple
    common_multiple = 0
    (2..9).each do |num|
       multiple = @smallest_multiple.multiple_of_two_numbers(num, num+1)
       if @smallest_multiple.number_is_a_multiple_of_these_two?(multiple, 2, num+1)
         common_multiple = multiple
        end
       puts "Num1: #{num}, Num2: #{num+1} = Common: #{common_multiple}"
    end
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

  def multiple_of_two_numbers(num1, num2)
    num1 * num2
  end

  def number_is_a_multiple_of_these_two?(test_number, num1, num2)
    remainder = 0
    (num1..num2).each do |divisor|
      remainder += test_number % divisor
    end
    return true if remainder == 0 else return false
  end


end