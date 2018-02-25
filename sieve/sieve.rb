class Sieve

  def initialize(number)
    @number = number
  end

  def primes
    # Follow the naive pseudocode approach given on https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes . Extremely inefficient and should be refactored
    number_list = Array.new(@number+1, true)
    number_list[0] = false
    number_list[1] = false
    primes_list = []

    (2..Math.sqrt(@number)).each do |i|
      if number_list[i]
        (0..@number).each do |j|
          k = i**2 + j*i
          number_list[k] = false
        end
      end
    end

    number_list.each_with_index do |value, index|
      primes_list << (index) if value == true
    end

    primes_list
  end


end

module BookKeeping
  VERSION = 1
end