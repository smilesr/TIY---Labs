require './board'
require './human'
require './computer'
require './tictactoe'

# x = String.new
# name = String.new
# designation = String.new

puts "You are playing tic tac toe."
puts ""
puts "Is first player human or computer:"
x = gets.chomp.capitalize
# puts "Name of first player (can hit <enter> if computer):"
# name = gets.chomp
#puts "Will the first player be 'x' or 'o':"
designation = 'X'

if x == "Human"
  player1 = Human.new(designation)
elsif x == "Computer"
  player1 = Computer.new(designation)
end

puts "Is second player human or computer:"
x = gets.chomp.capitalize
# puts "Name of second player (can hit <enter> if computer):"
# name = gets.chomp
designation = 'O'

if x == "Human"
  player2 = Human.new(designation)
elsif x == "Computer"
  player2 = Computer.new(designation)
end

game_time = TicTacToe.new(player1, player2)
game_time.play