require 'pry'
require 'set'

#A greeting for the user.
#A prompt that tells the user the partially completed word. It may also do input validation (make sure they give a letter)
# or state the number of remaining turns.
#A game over state that tells the player if they won or lost and tells them the word they were trying to guess.

#pick answer
#take guess from user
#compare guess to answer
#track bad guesses and print out
#print status of answer
# track turn

def valid_guess (guess, guesses)
	guess.downcase
	guess.include?(a .. z) && !guesses(guess)
end

# GET A NEW LETTER
def new_guess()
	until valid_guess (guesses, guess)
		puts "here are your previous guesses: #{guesses}"
		puts "please guess a letter"
		guess = gets.chomp
	end
end



	#guess_array = guess.chars.each {|x|}
	#guesses = guess_array.to_set


def word_complete?(answer, guesses)
  	if guesses == answer.chars.to_set
  		put "you win.  the word is #{answer}"
	end  
end

# COMPARE
def intermediate_word(guesses, answer)
  #answer.each_char { |l| guesses.include?(l) ? print l : print "-" }
  	answer.chars.each do |letter|
    #guesses.include?(letter) ? print letter : print "-"
    	if guesses.include?(letter)
      		print letter
    	else
      		print "-"
    	end
  	end
end

def the_word_to_guess ()
	words = ["advert", "creep", "venture", "viewing", "shoe", "freedom", "employ"]
	answer = words.sample
end

def play_hangman()
	turn_counter = 7
	guesses = Set.new
	the_word_to_guess()
	puts answer
	new_guess(guesses)

puts "the word to guess has #{answer.length} letters"

unless guesses == answer.chars.to_set
	new_guess()
	word_complete?(answer, guesses)
	intermediate_word(guesses, answer)
end

#binding.pry