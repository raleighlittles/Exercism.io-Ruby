module Hamming

  def self.compute(string1, string2)
    # From the tests, we see that we need to raise ArgumentError if the string's lengths don't match
    raise ArgumentError if (string1.length != string2.length)

    distance = 0
    index = 0
    while (index < string1.length)
      if string1[index] != string2[index]
        distance += 1
      end

      index += 1
    end

    return distance
  end
end

module BookKeeping
  VERSION = 3
end