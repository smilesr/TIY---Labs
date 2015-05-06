# generate random number between 1-100
r = rand(1..100)
	while true
	# ask user for their guess of the random number
	puts "What is your guess?"
	g = gets.chomp.to_i
		# evaluate whether guess was correct
		if g < r
			puts "higher"
		elsif g > r
			puts "lower"
		else
			puts "you got it"
			break
		end
	end
puts "the right answer was #{r}"