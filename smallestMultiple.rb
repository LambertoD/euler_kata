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

  def test_number_is_multiple_of_another_number
    test_number = 3
    test_multiple = 12
    assert @smallest_multiple.numbers_are_multiples?(test_multiple, test_number), 
      "Numbers are not multiples #{test_multiple} : #{test_number}"
  end

  def test_number_is_not_multiple_of_another_number
    test_number = 5
    test_multiple = 12
    assert @smallest_multiple.numbers_are_multiples?(test_multiple, test_number), 
      "Numbers are not multiples #{test_multiple} : #{test_number}"
  end

  def test_get_next_multiple
    last_multiple = 12
    latest_number = 5
    assert_equal 60, @smallest_multiple.get_next_multiple(last_multiple, latest_number)
  end

  def test_successfully_getting_a_lower_multiple
    latest_multiple = 120
    number_series = [2, 3, 4, 5, 6]
    assert_equal 60, @smallest_multiple.return_a_lower_multiple_if_any(latest_multiple, number_series)
  end

  def test_get_multiple_of_numbers_1_to_10
    number_series = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert_equal 2520, @smallest_multiple.get_multiple_of_number_series(number_series)
  end

  def test_get_multiple_of_numbers_1_to_20
    number_series = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    assert_equal 0, @smallest_multiple.get_multiple_of_number_series(number_series)
  end

end

class SmallestMultiple

  def get_multiple_of_number_series(number_series)
    multiple = 1
    number_series.each do |number|
      sub_series = Array.new(number) { |i| i+1 }
      puts "sub_series: #{sub_series}"
      puts "current multiple: #{multiple}  number_to_test: #{number}"
      if number > 1
        if number.even? 
          divide_by = 2 
        else 
          divide_by = 3
        end  
        multiple = derive_multiple(multiple, number, sub_series, divide_by)
      end  
    end
    multiple
  end

  def derive_multiple(multiple, number, sub_series, divide_by)
    multiple_found = false
    while multiple_found == false
      if number_is_a_multiple_of_number_series?(multiple, sub_series)

        multiple = return_a_lower_multiple_if_any(multiple, sub_series, divide_by)
        multiple_found = true
      else
        multiple = multiple * number
      end    
    end
    multiple
  end

  def number_is_a_multiple_of_number_series?(test_number, number_series)
    remainder = 0
    (number_series).each do |divisor|
      remainder += test_number % divisor
    end
    if remainder == 0 
      return true 
    else 
      return false
    end
  end

  def get_next_multiple(num1, num2)
    num1 * num2
  end

  def numbers_are_multiples?(test_multiple, test_number)
    test_number > 0 || raise("divide by zero error")
    if test_multiple % test_number == 0
      return true
    else
      return false
    end
  end

  def return_a_lower_multiple_if_any(multiple_to_test, number_series, divide_by = 2)
    new_multiple = multiple_to_test
    while true
      lower_multiple = multiple_to_test / divide_by
      puts "multiple_to_test: #{multiple_to_test} lower_multiple: #{lower_multiple}"
      if number_is_a_multiple_of_number_series?(lower_multiple, number_series)
        new_multiple = multiple_to_test = lower_multiple
      else
        break
      end
    end
    puts "multiple chosen: #{new_multiple}"
    new_multiple
  end


  def is_multiple_of_numbers_1_to_10?(number)
    remainder = 0
    (1..10).each do |divisor|
      remainder += number % divisor
    end
    puts "remainder is #{remainder}"
    if remainder == 0 
      return true 
    else 
      return false
    end
  end

end