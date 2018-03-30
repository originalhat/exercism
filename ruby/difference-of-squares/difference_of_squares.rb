class Squares
  def initialize(length)
    @length = length
  end

  def square_of_sum
    (0..@length).to_a.inject(0) {|sum, x| sum + x} ** 2
  end

  def sum_of_squares
    (0..@length).to_a.inject(0) {|sum, x| sum + x ** 2}
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end