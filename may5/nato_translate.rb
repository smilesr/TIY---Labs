def translate_to_NATO_function(word, my_alpha)
	word.each_char do |x|
		my_alpha.each do |y,z|
			if y==x
				puts z
			end
		end
	end
end

def translate_to_English_function(my_alpha, word)
	my_alpha.each do |y,z|
		if z==word
			puts y
		end
	end
end

my_alpha = {
	"a" => "alpha",
	"b" => "beta",
	"c" => "charlie",
	"d" => "delta",
	"e" => "echo",
	"f" => "foxtrot",
	"g" => "golf",
	"h" => "hotel",
	"i" => "india",
	"j" => "juliett",
	"k" => "kilo ",
	"l" => "lima",
	"m" => "mike",
	"n" => "november",
	"o" => "oscar",
	"p" => "papa",
	"q" => "quebec",
	"r" => "romeo",
	"s" => "sierra",
	"t" => "tango",
	"u" => "uniform",
	"v" => "victor",
	"w" => "whiskey",
	"x" => "xray",
	"z" => "zulu"
}

puts "Do you want to translate from (1) English to NATO or (2) NATO to English: enter number"
which_language = gets.chomp
if which_language == "1"
	puts "Enter a word to translate into NATO format"
	word = gets.chomp
	translate_to_NATO_function(word, my_alpha)
elsif which_language == "2"
	puts "Enter a 'word' to translate into English"
	word = gets.chomp
	translate_to_English_function(my_alpha, word)
end
	

	