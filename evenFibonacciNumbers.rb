require 'minitest/autorun'

class TestEvenFibonacciNumbers < MiniTest::Unit::TestCase
  def setup
    @fibo_numbers = FibonacciNumbers.new
  end

  def test_generates_correct_fibo_sequence_upto_100
    upto_100 = 100
    expected_fibo_sequence = [1,2,3,5,8,13,21,34,55,89]
    assert_equal expected_fibo_sequence, @fibo_numbers.get_fibo_numbers(upto_100)
  end

  def test_collect_even_fibo_seqeunce
    upto_100 = 100
    expected_fibo_sequence = [2,8,34]
    assert_equal expected_fibo_sequence, @fibo_numbers.get_even_fibo_numbers(upto_100)
  end

  def test_sum_of_even_fibo_numbers_up_to_100
    upto_100 = 100
    expected_sum = 44
    assert_equal expected_sum, @fibo_numbers.sum_of_even_fibo_numbers(upto_100)
  end

  def test_sum_of_even_fibo_numbers_up_to_4000000
    upto_100 = 4000000
    expected_sum = 461372
    assert_equal expected_sum, @fibo_numbers.sum_of_even_fibo_numbers(upto_100)
  end
end

class FibonacciNumbers
  def initialize
    @fibo_collection = []
  end

  def get_fibo_numbers(upto_number)
    fprev = 1
    @fibo_collection << fprev 
    temp = 0
    fnext = 2
    while fnext < upto_number do
      temp = fprev + fnext
      @fibo_collection << fnext
      fprev = fnext
      fnext = temp
    end
    @fibo_collection
  end

  def get_even_fibo_numbers(upto_number)
    get_fibo_numbers(upto_number)
    even_fibo_collection =  @fibo_collection.select { |num| num.even? }
  end

  def sum_of_even_fibo_numbers(upto_number)
    even_fibo_collection = get_even_fibo_numbers(upto_number)
    even_fibo_collection.inject(0) { |sum, number| sum += number}
  end

end