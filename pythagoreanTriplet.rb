require 'minitest/autorun'

class TestSpecialPythagoreanTriplet < MiniTest::Unit::TestCase
  def setup
    @squares = create_hash_of_squares   
    @pythagorean_triplet = PythagoreanTriplet.new(@squares)
    @pythagorean_triplet.triplet_extraction

  end

  def create_hash_of_squares
    q_id = (2..1000).to_a
    squares = {}
    q_id.each do |val|
      squares[val] = val * val
    end
    squares    
  end

  # def test_creation_of_hash_of_squares
  #   # usage
  #   puts "hash[2] is: #{@squares[3-1]}"
  #   result = 1000 - @squares[2]
  #   puts "1000 less first square hash is : #{result}"
    
  #   (2..10).each { |i| puts @squares[i] } 
  #   @squares.has_value?(4)   #=> true
  #   @squares.key(4)          #=> 2
  # end

  def test_extraction_of_triplets
    puts "triplet lenght is: "
    puts @pythagorean_triplet.triplets.size  
    @pythagorean_triplet.triplets.each do |item|
      print "value of triplet: "
      print item
      print " sum of triplets: "
      print item.inject(0) { |sum,item| sum+=item }
      print
      puts
    end
  end

  # def test_sum_of_triplets_at_1000
  #   @pythagorean_triplet.triplets.each_with_index  do |item,index|
  #     print item
  #     sum = item.inject(0) { |sum,item| sum+=item }
  #     puts sum
  #     if index % 100 == 0
  #       puts "processing triplets... #{index}"
  #     end     
  #   end  
  #   puts "test end"
  # end

  # def test_hash_iteration
  #   @squares.each_value do |value|
  #     puts "value is: #{value}"
  #     triplet_extraction(value)
  #   end
  # end

  # def triplet_extraction(value)
  #   total_for_2_triplets = 1000 - value
  #   # puts "total of A is: #{value}"
  #   # puts "total of B and C is: #{total_for_2_triplets}"
  #   i = 2
  #   while @squares[i]     
  #     # puts "in while square test for B value: #{@squares[value + i]}"
  #     triplet3 = total_for_2_triplets - @squares[i]
  #     # puts "in while square test for C value: #{triplet3}"
  #     if @squares.has_value?(triplet3)
  #       a_value = value 
  #       b_value = @squares[i]
  #       c_value = triplet3
  #        puts "SUCCESS values are: #{a_value} , #{b_value} , #{c_value}"       
  #       break
  #     else
  #       i += 1
  #     end
  #   end
  # end

end

class PythagoreanTriplet
  attr_reader :triplets

  def initialize(squares)
    @squares = squares
    @triplets = []
    @triplet_count = 0
  end

  def triplet_extraction
    @squares.reverse_each do |h_squares|
      get_triplets(h_squares.last)
    end
  end

  def get_triplets(value)
    index = 2
    while index < @squares.length
      triplet = value - @squares[index]
      if @squares.has_value?(triplet)
        @triplets << extract_naturals(value, @squares[index], triplet)
        if @triplet_count % 10 == 0
          puts "processing loading of triplet array ... #{@triplet_count}"
        end       
        @triplet_count += 1
        # break statement caused generation of a smaller set of triplets
      end
      index += 1
    end 
  end

  def extract_naturals(a, b, c)
    triplet_array = Array.new
    triplet_array[0] = @squares.key(a)
    triplet_array[1] = @squares.key(b)
    triplet_array[2] = @squares.key(c)
    triplet_array.sort
  end

end



