class Year

  def self.leap?(year)
=begin
Leap year rules:

on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400

=end

    if (year % 4 == 0)
      leap = true
        if (year % 100 == 0)
          leap = false
          if (year % 400 == 0)
            leap = true
          end
        end
    end

    return leap
  end
end

module BookKeeping
  VERSION = 3
end