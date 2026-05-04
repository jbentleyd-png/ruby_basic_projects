dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

# this won't work if there's any repeated letters in the dictionary or the word, but that's not what they had in the example.
def substrings (string, dictionary)
  output_hash = Hash.new(0)
  
  input_array = string.chars
  dictionary.each do |dict_word|
    dict_word_array = dict_word.chars

    if (input_array - dict_word_array).length == (input_array.length - dict_word_array.length)
      output_hash[dict_word] += 1
    end
  end
  output_hash
end

puts substrings("below", dictionary)

# puts ["b", "e", "l", "o", "w"] - ["l", "o", "w"] # it's in there
# => be aka length equals word length minus dictionary length
# puts ["b", "e", "l", "o", "w"] - ["r", "y", "a"] # it's not in there
# => below aka length = word length aka word DOES equal word length minus dictionary length
# puts ["b", "e", "l", "o", "w"] - ["o", "w", "n"] # it's kind of in there
# => bel aka word does not equal word length minus dictionary length
# 