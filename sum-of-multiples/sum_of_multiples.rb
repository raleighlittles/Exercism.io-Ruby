require 'set'

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(maximum)
    multiples_list = []
    @numbers.each do |number|
      (number...maximum).step(number).each do |factor|
        multiples_list << factor if (multiples_list.include?(factor) == false)
      end
    end
    #puts "All multiples of #{@numbers} up to #{maximum} are: #{multiples_list.to_s}"
    multiples_list.sum()

  end
end


module BookKeeping
  VERSION = 2
end