require 'minitest/autorun'

class TestCollatzSequence < MiniTest::Unit::TestCase
  def setup
    @collatz = CollatzSequence.new
  end

  def test_N_over_2_when_even
    assert_equal 20, @collatz.n_over_2(40)
  end

  def test_3N_plus_1
    assert_equal 40, @collatz.three_N_plus_1(13)
  end

  def test_sequence_if_even
     assert_equal 20, @collatz.get_current_sequence(40)
  end

  def test_sequence_if_odd
    assert_equal 40, @collatz.get_current_sequence(13)
  end

  def test_get_terms_for_number_13
    assert_equal 10, @collatz.generate_sequence_for(13)
  end

  def test_get_all_terms_for_numbers_under_1_million
    q_id = (2..1000000).to_a
    terms_hash = {}
    highest_term = 0
    q_id.each do |value|
      terms_hash[value] = @collatz.generate_sequence_for(value)
      highest_term = terms_hash[value] if terms_hash[value] > highest_term
      puts " ... processing #{value} ... highest_term so far: #{highest_term}" if value % 10000 == 0
    end
    puts "Highest Term: #{highest_term}"
    puts " Number is #{terms_hash.key(highest_term)}"
  end

end

class CollatzSequence


  def n_over_2(n)
    n/2
  end

  def three_N_plus_1(n)
    3*n + 1
  end

  def get_current_sequence(n)
    n.even? ? n_over_2(n) : three_N_plus_1(n)    
  end

  def generate_sequence_for(number)
    terms = 1
    sequence_value = number
    until sequence_value == 1
      # puts
      # print "sequence value: #{sequence_value}"
      sequence_value = get_current_sequence(sequence_value)
      # print " next sequence: #{sequence_value}"
      terms += 1
      # print " term value: #{terms}"
    end
    # print "number to test: #{number} terms: #{terms}"
    # puts
    terms
  end

end

