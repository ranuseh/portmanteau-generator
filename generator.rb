
def is_vowel? (letter)
  # method to check if letter is a vowel
  if ['a','e','i','o','u'].include?(letter)
    return true # returns true if a vowel is found
  else
    return false # otherwise returns false
  end
end

def find_first_vowel (word)
  # method looks for the first vowel in a word
  # returns the index of that word
  word.split('').each.with_index do |char, index| # word string is split into an array of characters and with each
    # iteration the vowel method is called to check the characters for vowels
    if is_vowel?(char)
      return index # once a vowel is found, returns stops the loop and the index of the character that is a vowel is returned
    end
  end
  return 0 # if no vowels are found then the default index is set to 0
end

def find_last_vowel (word) 
  # method looks for the last vowel in a word 
  # returns the index of that word
  last_index = word.length # begins by setting last index to the length 
  # of word. This is over ridden if a vowel is found. If no vowel is found the index will be the entire length of word
  word.split('').each.with_index do |char, index|  # word string is split into an array of characters and with each
    # iteration the vowel method is called to check the characters for vowels
    if is_vowel?(char)
      last_index = index # if that character is a vowel then last 
      # index variable is replaced with the index of that character. 
      # Loop continues checking and replacing if nessesary untill all characters have been checked
    end
  end
  return last_index # if no vowels are found then the default is set to last index which will the the length of the string
end

def create_first_word (word)
  index = find_last_vowel(word) # last index returned from calling find last vowel method is assigned to index
  result = word.slice(0, index) # the word is then sliced only from 
  # the very beginning index 0 to the location of the last index as determined by the find last vowel method 
  return result
end

def create_second_word (word) 
  index = find_first_vowel(word) # last index returned from calling find last vowel method is assigned to index
  result = word.slice(index, word.length)  # the word is then sliced only from 
  # the first vowel index to the location of the last index which is the entire length of the string
  return result
end

def run_generator
  puts 'Welcome to Portmanteau Generator!'
  puts 'Please enter your first word.:'
  first_word = gets.chomp # user enters thier first word
  while first_word.length < 2 # checks to ensure that the length of the word is 2 or more characters
    puts 'Please enter more than 2 characters'
    first_word = gets.chomp # assigns user input to variable
  end
  puts 'Please enter your second word.:'
  second_word = gets.chomp
  while second_word.length < 2
    puts 'Please enter more than 2 characters'
    second_word = gets.chomp
  end
  puts "Your first word is #{first_word}" # outputs what the first word is
  puts "Your second work is #{second_word}" # outputs what the second word is

  return create_first_word(first_word).capitalize + create_second_word(second_word).downcase
  # returns the result of calling the create words methods with first word and second word 
  # as arguments and then properly formatting to capitalize the first letter only
end

result = run_generator # the result of calling this method is saved to a variable

puts "#{result} is your creation!" # the variable is outputted to the console
