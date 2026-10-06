# Given a string (sentence) and a dictionary (list of words), this method will return how many times the dictionary words could be used as substrings in the words of the sentence.
# This won't work if there's any repeated letters in the dictionary or the word, but that's not what they had in the example.


def substrings (string, dictionary)
  # make every word in the dictionary an array of letters:
  dictionary_arr = dictionary.map {|dict_word| dict_word.downcase.chars } 

  # removes non-letters, and creates an array words from the string:
  input_words = string.downcase.gsub(/[^a-zA-Z\s]/, '').split
  output_hash = Hash.new(0)

  input_words.each do |input_word|
    word_arr = input_word.chars
    
    dictionary_arr.each do |dict_word|
      if (word_arr - dict_word).length == (word_arr.length - dict_word.length) # meaning one fully contains the other
        output_hash[dict_word.join] += 1
      end
    end
  end
  output_hash
end


# TEST CASES:
dictionary = ["below","down","go","going","horn","how","howdy","it","I","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)

