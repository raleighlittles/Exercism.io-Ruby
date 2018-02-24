module Raindrops

  def self.convert(number)

    result = ''
    divisors = Array.new()

    (1..number).each do |n|
      if (number % n == 0)
        divisors << n
      end
    end

    if divisors.include?(3)
      result << 'Pling'
    end

    if divisors.include?(5)
      result << 'Plang'
    end

    if divisors.include?(7)
      result << 'Plong'
    end

    if result.empty?
      return number.to_s
    end

    return result

  end
end

module BookKeeping
  VERSION = 3
end