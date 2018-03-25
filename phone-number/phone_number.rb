module PhoneNumber

  def self.clean(phonenumber_string)

    return nil if (phonenumber_string.match?(/[a-zA-Z]/))

    number_chunks = phonenumber_string.split(/\W/)
    number_chunks.each {|substr| substr = substr.gsub(/\W/, '')}
    phone_number_cleaned = number_chunks.join('')

    if phone_number_cleaned.length == 11
      if phone_number_cleaned[0] == '1'
        return phone_number_cleaned[1..-1]

      else
        return nil
      end

    elsif phone_number_cleaned.length > 11
      return nil

    elseif phone_number_cleaned.length < 10
      return nil

    elsif phone_number_cleaned.length == 10
      if (phone_number_cleaned[0].to_i < 2 || phone_number_cleaned[3].to_i < 2)
        return nil # area code or exchange code can't start with any number less than 2

      else
        return phone_number_cleaned
      end
    end
  end
end


module BookKeeping
  VERSION = 2
end