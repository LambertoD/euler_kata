require 'minitest/autorun'
load 'primeComposer.rb'

class TestSumOfPrimes < MiniTest::Unit::TestCase
  def setup
    @prime_number_generator = PrimeNumberGenerator.new(ceiling: 2000000 ,primes_array: Array.new)
  end

  # def test_sum_of_primes_below_10
  #   @prime_number_generator.generate_primes
  #   puts "contents: #{@prime_number_generator.primes_array}"
  #   assert_equal 17, @prime_number_generator.sum_of_primes(10)
  # end

  def test_sum_of_primes_below_2000000
    @prime_number_generator.generate_primes
    puts "contents: #{@prime_number_generator.primes_array}"
    assert_equal 17, @prime_number_generator.sum_of_primes(10)
  end
end
