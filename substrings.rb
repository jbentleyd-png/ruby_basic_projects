dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# this won't work if there's any repeated letters in the dictionary or the word, but that's not what they had in the example.
def substrings (string, dictionary)
  output_hash = Hash.new(0)
  
  input_full_array = string.downcase.gsub(/[^a-zA-Z\s]/, '').split
  input_full_array.each do |input_word|
    input_word_array = input_word.chars
    
    dictionary.each do |dict_word|
      dict_word_array = dict_word.chars

      if (input_word_array - dict_word_array).length == (input_word_array.length - dict_word_array.length)
        output_hash[dict_word] += 1
      end

    end
  end
  output_hash
end

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

