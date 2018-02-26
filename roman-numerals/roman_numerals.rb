class Integer
  def to_roman
=begin
As a reminder, here's the full list of roman numerals:
SYMBOL       VALUE
I             1
IV            4
V             5
IX            9
X             10
XL            40
L             50
XC            90
C             100
CD            400
D             500
CM            900
M             1000
=end

    thousands = ['', 'M', 'MM', 'MMM'] # max number is 3000
    hundreds = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
    tens = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
    ones = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']

    # Extract the digit in the thousands, hundreds, tens, and ones place
    thousands_string = thousands[self / 1000]
    hundreds_string = hundreds[(self % 1000) / 100]
    tens_string = tens[(self % 100) / 10]
    ones_string = ones[self % 10]

    result = thousands_string + hundreds_string + tens_string + ones_string

  end
end

module BookKeeping
  VERSION = 2
end