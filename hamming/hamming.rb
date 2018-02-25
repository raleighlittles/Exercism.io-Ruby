module Hamming

  def self.compute(string1, string2)
    # From the tests, we see that we need to raise ArgumentError if the string's lengths don't match
    raise ArgumentError if (string1.length != string2.length)


    (0...string1.length).count do |index|
      string1[index] != string2[index]
    end


  end
end

module BookKeeping
  VERSION = 3
end