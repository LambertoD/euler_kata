require 'minitest/autorun'

class TestLargestPrimeFactor < MiniTest::Unit::TestCase
  def setup
    @largest_prime_factor = LargestPrimeFactor.new
  end

  # def test_number_is_prime
  #   number_to_test = 5
  #   assert @largest_prime_factor.isPrime?(number_to_test), "number is prime"
  # end

  # def test_get_prime_factors_for_number
  #   number_to_test = 6
  #   expected_primes = [2,3]
  #   assert_equal expected_primes, @largest_prime_factor.get_primes(number_to_test)
  # end

  # def test_get_highest_prime_factor_for_6
  #   number_to_test = 6
  #   expected_highest_prime_factor = 3
  #   assert_equal expected_highest_prime_factor, @largest_prime_factor.get_highest_prime_factor(number_to_test)
  # end

  def test_get_highest_prime_factor_for_600851475143
    number_to_test = 600851475143
    # number_to_test = 13195
    expected_highest_prime_factor = 29
    assert_equal expected_highest_prime_factor, @largest_prime_factor.get_highest_prime_factor(number_to_test)
  end 
end

class LargestPrimeFactor

  def initialize
    @primes_collection = []
  end

  def get_primes(number)
    (2..number).each do | n |
      if number % n == 0 && isPrime?(n)
        @primes_collection << n 
        puts @primes_collection
      end
    end
    @primes_collection
  end

  def isPrime?(number)
    i = 2
    return true if number == 2

    while i < number 
      return false if number % i == 0
      i += 1
    end
    true
  end

  def get_highest_prime_factor(number)
    get_primes(number)
    @primes_collection.max

  end

end

