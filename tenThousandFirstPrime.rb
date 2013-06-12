require 'minitest/autorun'

class Test10001stPrime < MiniTest::Unit::TestCase
  def setup
    @prime_number_position = PrimeNumberPosition.new
  end

  def test_6th_prime
  	assert_equal 13, @prime_number_position.prime_position(6)
  end

  def test_10001st_prime
  	assert_equal 0, @prime_number_position.prime_position(10001)
  end

end

class PrimeNumberPosition

	def prime_position(position)
		prime_array = []
		number_for_testing = 2
		while prime_array.length < position
			if isPrime?(number_for_testing)			
				prime_array << number_for_testing
			end	
			number_for_testing += 1
		end
		puts prime_array
		prime_array[position - 1]		
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
