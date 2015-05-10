require 'set'
guesses1 = Set.new([1,2,3])
word = "hello"
letters = word.chars.to_set
puts letters.to_a
puts guesses1.to_a
