require 'minitest/autorun'
load 'primeComposer.rb'

class Test10001stPrime < MiniTest::Unit::TestCase
  def setup
    @prime_number_generator = PrimeNumberGenerator.new(size: 30005, primes_array: Array.new)
  end

  def test_6th_prime
    @prime_number_generator.generate_primes
    assert_equal 13, @prime_number_generator.prime_position(6)
  end

  def test_10001st_prime
    @prime_number_generator.generate_primes
  	assert_equal 0, @prime_number_generator.prime_position(10001)
  end

  def test_30001st_prime
    @prime_number_generator.generate_primes
    assert_equal 0, @prime_number_generator.prime_position(30001)
  end
end
