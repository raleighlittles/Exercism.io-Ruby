require 'set'
module Pangram

  def self.pangram?(phrase)
    alphabet = ('a'..'z').to_set
    # The chars method converts a string into an array of characters. We then extract that to a set to remove duplicates
    return (alphabet.subset?(phrase.downcase.chars.to_set))
  end


end

module BookKeeping
VERSION = 6
end
