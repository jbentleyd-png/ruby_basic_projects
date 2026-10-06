# When given a string,returns a string with all letters shifted forward or backwards by a given value.

def shift_letter(current_letter, letter_array, shift_value)
  current_index = letter_array.index { |letter| letter == current_letter }

  return current_letter if current_index.nil? # don't shift numbers and punctuation 
    
  new_index = current_index + shift_value
  new_index -= 26 if new_index > 25 # wrap
  letter_array[new_index]
end


def caesar_cipher(any_string, shift_value)
  downcase_letters = ('a'..'z').to_a
  uppercase_letters = ('A'..'Z').to_a
  ref_array = nil
  shifted_letters = []

  any_string.chars.each do |character|
    ref_array = (character == character.downcase) ? downcase_letters : uppercase_letters
    shifted_letters << shift_letter(character, ref_array, shift_value)
  end

  shifted_letters.join
end


# Testing:
puts caesar_cipher("What a string!", 5)
# Expect "Bmfy f xywnsl!"
