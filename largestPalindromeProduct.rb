require 'minitest/autorun'

class TestLargestPalindromePRoduct < MiniTest::Unit::TestCase
  def setup
    @largest_palindrome_product = LargestPalindromeProduct.new
  end

  def test_number_is_palindrome
    number_to_test = 9119
    assert @largest_palindrome_product.isPalindrome?(number_to_test), "number #{number_to_test} is NOT palindrome"
  end

  def test_get_factors_as_arrays
    @largest_palindrome_product.produce_2_digit_factor_collection
    assert_equal 89, @largest_palindrome_product.factor1_collection.length
    @largest_palindrome_product.produce_3_digit_factor_collection
    assert_equal 900, @largest_palindrome_product.factor1_collection.length

  end

  def test_factor_collection_is_equal
    @largest_palindrome_product.produce_2_digit_factor_collection
    assert_equal @largest_palindrome_product.factor1_collection, @largest_palindrome_product.factor2_collection
  end   

  def test_load_products_in_array
    @largest_palindrome_product.produce_2_digit_factor_collection
    refute_empty @largest_palindrome_product.get_products_for_test_factors
  end

  def test_largest_palindrome_products_is_9009_for_2_digit_factors
    @largest_palindrome_product.produce_2_digit_factor_collection
    @largest_palindrome_product.get_products_for_test_factors
    assert_equal 9009, @largest_palindrome_product.get_largest_palindrome
  end

  def test_largest_palindrome_product_for_3_digit_factors
    @largest_palindrome_product.produce_3_digit_factor_collection
    @largest_palindrome_product.get_products_for_test_factors
    assert_equal 0, @largest_palindrome_product.get_largest_palindrome

  end
end

class LargestPalindromeProduct
  attr_reader :factor1_collection, :factor2_collection
  def initialize
    @factor1_collection = []
    @factor2_collection = []
    @product_collection = []
  end

  def isPalindrome?(number)
    saved_number = number.to_s
    reversed_number = saved_number.reverse
    saved_number == reversed_number
  end

  def produce_2_digit_factor_collection
    factor_array = []
    (11..99).each { |f1| factor_array << f1 }
    @factor2_collection = @factor1_collection = factor_array
  end


  def produce_3_digit_factor_collection
    factor_array = []
    (100..999).each { |f1| factor_array << f1 }
    @factor2_collection = @factor1_collection = factor_array
  end

  def factor1_collection=(array)
    @factor1_collection = array
  end

  def factor2_collection=(array)
    @factor2_collection = array
  end

  def get_products_for_test_factors
    @factor1_collection.each do |f1|
      @factor2_collection.each do |f2|
        product = f1 * f2 
        if isPalindrome?(product)
          @product_collection << product 
        end
      end
    end
    @product_collection
  end

  def get_largest_palindrome
    @product_collection.max
  end
end
