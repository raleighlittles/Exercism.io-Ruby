module Complement

  def self.of_dna(dna_strand)
=begin
    According to the README, the complement function (C) is defined as

    C(G) = C
    C(C) = G
    C(T) = A
    C(A) = U
=end

    complement_strand = ''

    dna_strand.each_char do |char|
      case char
        # from reading the test, we know all dna_strands will be uppercase
        when 'G'
          complement_strand << 'C'

        when 'C'
          complement_strand << 'G'

        when 'T'
          complement_strand << 'A'

        when 'A'
          complement_strand << 'U'

        else # when strand is partially invalid, just return an empty string
          return ''

      end
    end

    return complement_strand
  end
end

module BookKeeping
  VERSION = 4
end