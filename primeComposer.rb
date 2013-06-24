require 'minitest/autorun'

# class TestPrimeFunctions < MiniTest::Unit::TestCase
#   def setup
#     @prime_number_generator = PrimeNumberGenerator.new(size: 10, primes_array: Array.new)
#   end


#   def test_number_is_prime
#     number_to_test = 5
#     assert @prime_number_generator.isPrime?(number_to_test), "number is prime"
#   end


#   def test_direct_access_to_prime_number_generator
#     @prime_number_generator.generate_primes
#     puts "PrimeNumberGenerator instance: "
#     print @prime_number_generator.primes_array

#   end

#   def test_6th_prime
#     @prime_number_generator.generate_primes
#     assert_equal 13, @prime_number_generator.prime_position(6)
#   end
# end

class PrimeNumberGenerator
  attr_reader :size, :primes_array, :ceiling

  def initialize(args={})
    @size         = args[:size]
    @primes_array = args[:primes_array]
    @ceiling      = args[:ceiling]  
  end

  def generate_primes
    if @size.nil?
      puts "ceiling: #{@ceiling}"
      generate_primes_using_ceiling
    elsif @ceiling.nil?
      puts "size: #{@size}"
      generate_primes_using_size
    else
      puts "Arguments supplied are not correct"
    end
  end

  def generate_primes_using_size
    number_for_testing = 2
    while @primes_array.length < @size
      if isPrime?(number_for_testing)     
        @primes_array << number_for_testing
      end 
      number_for_testing += 1
    end
  end

  def generate_primes_using_ceiling
    @primes_array << 2
    number_for_testing = 3
    index = 0
    puts @primes_array[index]
    puts @ceiling
    while @primes_array[index] < @ceiling
      if isPrime?(number_for_testing) 
        @primes_array << number_for_testing
        index += 1   
      end 
      number_for_testing += 1   
      if number_for_testing % 10000 == 0
        puts "processing ... #{number_for_testing}"
      end
      break if number_for_testing > @ceiling
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

  def prime_position(position)
    @primes_array[position - 1]   
  end

  def sum_of_primes(value)
    @primes_array.inject(0) { |sum,item| sum+=item }
  end
end



