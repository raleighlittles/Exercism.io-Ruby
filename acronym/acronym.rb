module BookKeeping
  VERSION = 4
end

module Acronym
  def self.abbreviate(string)
    acronym = ''

    string.split(/[\W]|[\s]/).each do |word|
      acronym << word[0].capitalize if (word[0].nil? == false)
    end
    
    return acronym
  end
end