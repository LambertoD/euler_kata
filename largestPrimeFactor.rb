require 'minitest/autorun'
load 'primeComposer.rb'

class TestLargestPrimeFactor < MiniTest::Unit::TestCase
  def setup
    @largest_prime_factor = LargestPrimeFactor.new(primes: PrimeNumberGenerator.new(size: 30000, primes_array: Array.new))
    @largest_prime_factor.primes.generate_primes
  end

  def test_get_prime_factors_for_number
    # number_to_test = 6
    number_to_test = 13195
    expected_primes = [5,7,13,29]
    assert_equal expected_primes, @largest_prime_factor.get_factor_primes(number_to_test)
  end

  def test_get_highest_prime_factor_for_13195
    number_to_test = 13195
    expected_highest_prime_factor = 29
    @largest_prime_factor.get_factor_primes(number_to_test)
    assert_equal expected_highest_prime_factor, @largest_prime_factor.highest_prime_factor(number_to_test)
  end

  def test_get_highest_prime_factor_for_600851475143
    number_to_test = 600851475143
    expected_highest_prime_factor = 29
    @largest_prime_factor.get_factor_primes(number_to_test)
    assert_equal expected_highest_prime_factor, @largest_prime_factor.highest_prime_factor(number_to_test)
  end 
end

class LargestPrimeFactor
  attr_reader :primes

  def initialize(args={})
    @primes = args[:primes]
    @prime_factors_collection = []
  end

  def get_factor_primes(number)
    @primes.primes_array.each do | n |
      if number % n == 0
        @prime_factors_collection << n 
        print @prime_factors_collection
        puts
      end

      break if number < n
    end
    @prime_factors_collection
  end

  def highest_prime_factor(number)
    @prime_factors_collection.max

  end

end

