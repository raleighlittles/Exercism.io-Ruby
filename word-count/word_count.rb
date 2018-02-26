class Phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.split(/[^a-zA-Z0-9'"]+/)
    frequencies = Hash.new(0)
    words.each do |word|
      word.gsub!(/^'|'$/, '') # regex to remove apostrophes at end of word or beginning, but not middle
      (frequencies[word.downcase] += 1) if word.length > 0
    end

    frequencies
  end

end

module BookKeeping
  VERSION = 1
end