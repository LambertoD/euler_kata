require 'minitest/autorun'

class TestPrimeFunctions < MiniTest::Unit::TestCase
  def setup
    @prime_number_generator = PrimeNumberGenerator.new(size: 5, primes_array: Array.new)
    @prime_utilities = PrimeUtilities.new(primes: PrimeNumberGenerator.new(size: 20, primes_array: Array.new))
  end


  def test_direct_access_to_prime_number_generator
    @prime_number_generator.generate_primes
    puts "PrimeNumberGenerator instance: "
    print @prime_number_generator.primes_array

  end

  def test_injected_prime_number_generator
    puts "PrimeUtilities instance: "
    @prime_utilities.primes.generate_primes
    print @prime_utilities.primes.primes_array
  end

  def test_6th_prime
    @prime_utilities.primes.generate_primes
    assert_equal 13, @prime_utilities.prime_position(6)
  end
end

class PrimeNumberGenerator
  attr_reader :size, :primes_array

  def initialize(args={})
    @size         = args[:size]
    @primes_array = args[:primes_array]
  end

  def generate_primes
    number_for_testing = 2
    while @primes_array.length < @size
      if isPrime?(number_for_testing)     
        @primes_array << number_for_testing
      end 
      number_for_testing += 1
    end
    
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
end


class PrimeUtilities
  attr_reader :primes

  def initialize(args={})
    @primes   = args[:primes]
  end

  def prime_position(position)
    @primes.primes_array[position - 1]   
  end
end
