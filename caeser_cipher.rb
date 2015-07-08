def caeser_cipher(string, n)
  alphabet = ('a'..'z').to_a

  string_array = string.downcase.split('')
  number_array = []

  string_array.each do |target_letter|
    alphabet.each_with_index do |letter, index| 
      number_array << ' ' if letter == ' '
      number_array << index if letter == target_letter
    end
  end
end