# For each number from 1 to n;
# If it's divisibl by 5 print Fizz.
# If it's divisible by 3 print Buzz.
# If it's divisable by 15, print FizzBuzz
# Otherwise, print the number

def fizz_buzz(n)
	1.upto(n) do |i|
		if i % 3 == 0
			puts "Buzz"
		elsif i % 5 == 0
			puts "Fizz"
		elsif i% 15 == 0
			puts "FizzBuzz"
		else
			puts i
		end
	end
end

fizz_buzz(100)
