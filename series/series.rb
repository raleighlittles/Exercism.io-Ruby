class Series

  def initialize(string)
    @string = string
  end

  def slices(n)
    substrings_array = []
    raise ArgumentError if n > @string.length

    @string.each_char.with_index do |letter, index|
      break if (index+n) > @string.length
      substrings_array << @string[index...index+n]
    end

    substrings_array
  end

end

