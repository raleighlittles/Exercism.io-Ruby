class BeerSong


  def verse(verse_number) # Taking the easy way out.
    if verse_number == 0
      return 'No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
'

    elsif verse_number == 1
      return '1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
'

    elsif verse_number == 2
      return "2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
"

    else
      return "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.
Take one down and pass it around, #{verse_number - 1} bottles of beer on the wall.
"
    end
  end

  def verses(verse_start, verse_end)
    lyrics = []
    # a hack to get around the fact that you can't do ranges in descending order
    (verse_end..verse_start).to_a.reverse.each do |verse_number|
      lyrics << verse(verse_number)
    end

    lyrics.join("\n")
  end

end

module BookKeeping
  VERSION = 3
end