def shifty(current_character, ref_array, shift_value)
  old_index = nil
  ref_array.each_with_index do |character, index|
    if character == current_character
      old_index = index
      break
    end
  end

  if old_index == nil
    return current_character
  else 
    new_index = old_index + shift_value
    if new_index > 25
      new_index -= 26
    end
    ref_array[new_index]
  end
end



def caesar_cipher(any_string, shift_value)
  downcase_letters = ('a'..'z').to_a
  uppercase_letters = ('A'..'Z').to_a
  ref_array =nil
  
  chopped_up_string = any_string.chars
  shifted_array = []


  chopped_up_string.each do |character|
    if  character == character.downcase
      ref_array = downcase_letters
    elsif character == character.upcase
      ref_array = uppercase_letters
    end
    shifted_array.push(shifty(character, ref_array, shift_value))

  end
  shifted_array.join
end

puts caesar_cipher("What a string!", 5)

