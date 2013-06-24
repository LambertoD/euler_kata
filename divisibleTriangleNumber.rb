require 'minitest/autorun'

class TestTriangleNumber < MiniTest::Unit::TestCase
  def setup
    @triangle_number = TriangleNumber.new
  end

  def test_counting_divisors
    assert_equal 6, @triangle_number.count_divisors(28)
  end

  def test_create_triangle_numbers
    assert_equal 28, @triangle_number.create_triangle_number_for(7)
  end

  def test_find_triangle_number_with_6_divisors
    assert_equal 28, @triangle_number.find_triangle_number_with_div_count(6)
  end

  def test_find_triangle_number_with_500_divisors
    assert_equal 28, @triangle_number.find_triangle_number_with_div_count(500)
  end
end

class TriangleNumber

  def initialize
    @triangle_array = []
  end

  def count_divisors(number)
    divisor = 1
    count = 0
    while divisor <= number
      count += 1 if number % divisor == 0
      divisor +=1
    end
    count
  end

  def create_triangle_number_for(number)
    prev_index = 0
    total = 0
    (1..number).each do |index|
      total = index + prev_index
      prev_index = total
    end
    total
  end

  def find_triangle_number_with_div_count(number)
    divisor_count = 0
    while divisor_count < number
      triangle_number = create_triangle_number_for(test_number)
      puts "test number: #{test_number} => triangle number: #{triangle_number}"
      divisor_count = count_divisors(triangle_number)
      puts " divisor count: #{divisor_count}" if divisor_count > 300
      test_number += 1
    end
    triangle_number
  end
end