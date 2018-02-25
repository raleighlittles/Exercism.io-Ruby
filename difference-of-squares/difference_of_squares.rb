class Squares

  def initialize(number)
    @number = number
  end

  def sum_of_squares
    return (1..@number).map {|i| i**2}.sum
  end

  def square_of_sum
    # Use the algebraic sum formula given in https://en.wikipedia.org/wiki/Summation
    sum = (@number * (@number + 1)) / 2
    return sum**2
  end

  def difference
    (square_of_sum - sum_of_squares)
  end

end

module BookKeeping
  VERSION = 4
end