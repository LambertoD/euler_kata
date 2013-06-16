require 'minitest/autorun'

class TestSpecialPythagoreanTriplet < MiniTest::Unit::TestCase
  def setup
    @pythagorean_triplet = PythagoreanTriplet.new()
    @squares = create_hash_of_squares
  end

  def create_hash_of_squares
    q_id = (2..35).to_a
    squares = {}
    q_id.each do |val|
      squares[val] = val * val
    end
    squares    
  end

  def test_creation_of_hash_of_squares
    # usage
    puts @squares[3-1]
    result = 1000 - @squares[2]
    puts "1000 less first square hash is : #{result}"
    
    (2..10).each { |i| puts @squares[i] } 
    @squares.has_value?(4)   #=> true
    @squares.key(4)          #=> 2
  end

  def test_hash_iteration
    @squares.each_value do |value|
      puts "value is: #{value}"
      triplet_extraction(value)
    end
  end

  def triplet_extraction(value)
    total_for_2_triplets = 1000 - value
    # puts "total of A is: #{value}"
    # puts "total of B and C is: #{total_for_2_triplets}"
    i = 2
    while @squares[i]     
      puts "in while square test for B value: #{@squares[value + i]}"
      triplet3 = total_for_2_triplets - @squares[i]
      # puts "in while square test for C value: #{triplet3}"
      if @squares.has_value?(triplet3)
        puts "SUCCESS"
        a_value = value 
        b_value = @squares[i]
        c_value = triplet3
        break
      else
        i += 1
      end
    end
  end

end

class PythagoreanTriplet

end



