def caesar_cipher(string, n)
  alphabet = ('a'..'z').to_a
  original_array = string.split('')
  string_array = original_array.map{ |letter| letter.downcase }
  number_array = []

  string_array.each do |target_letter|
    number_array << target_letter if !alphabet.include?(target_letter)
    alphabet.each_with_index do |letter, index| 
      number_array << index if letter == target_letter
    end
  end

  number_array.map! do |number|
    if number.is_a? String
      number
    elsif number + n >= alphabet.length
      (alphabet.length - (number + n)).abs
    else
      number + n
    end
  end

  output_array = []
  number_array.each_with_index do |number, index|
    if number.is_a? String
      output_array << number
    else 
      if original_array[index] == original_array[index].upcase
        output_array << alphabet[number].upcase
      else
        output_array << alphabet[number]
      end
    end
  end

  output_array.join('')
end

puts  caesar_cipher("What a string!", 5)

#Output => Bmfy f xywnsl!
