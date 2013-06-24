require 'minitest/autorun'
require 'stringio'

class TestLargeSum < MiniTest::Unit::TestCase

  def setup
    @raw_text = File.read('input100_50digitNumbers.txt')
    @large_sum = LargeSum.new(@raw_text)
  end 

  # def test_read_file_using_stringio
  #   str = StringIO.new(@raw_text)
  #   line = str.gets
  #   until line == nil
  #     puts "next line:"
  #     puts line 
  #     line = str.gets
  #   end
  # end

  def test_get_sum_of_numbers
    big_total = @large_sum.process_numbers_from_input
    assert_equal 10, big_total
  end
end

class LargeSum
  attr_reader :line

  def initialize(file)
    @str = StringIO.new(file)
  end

  def process_numbers_from_input
    total = 0
    line = @str.gets
    until line == nil
      number = line.to_i
      total += number
      puts "running total is: #{total}"
      line = @str.gets
    end
    puts "total is #{total}"
    total
  end

end
