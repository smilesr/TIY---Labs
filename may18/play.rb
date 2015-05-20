require './board'
require './human'
require './computer'
require './tictactoe'

# x = String.new
# name = String.new
# designation = String.new
#overall_game_tracker = 1
#while overall_game_tracker == 1
puts "You are playing tic tac toe."
puts ""
game_tracker = 1
while game_tracker ==1
  puts "Is first player human or computer:"
  x = gets.chomp.capitalize

  designation = 'X'

  if x == "Human"
    player1 = Human.new(designation)
  elsif x == "Computer"
    player1 = Computer.new(designation)
  end

  puts "Is second player human or computer:"
  x = gets.chomp.capitalize

  designation = 'O'

  if x == "Human"
    player2 = Human.new(designation)
  elsif x == "Computer"
    player2 = Computer.new(designation)
  end

  game_time = TicTacToe.new(player1, player2)
  game_time.play
  puts "Do you want to play again (1) yes or (2) no?"
  result = gets.chomp
  until result =~ /^[12]$/
    puts "Do you want to play again (1) yes or (2) no; enter 1 or 2?"
    result = gets.chomp
  end
  game_tracker = result.to_i
  if game_tracker == 1
    puts "OK. Let's play again"
    puts ''
  else
    puts "Thanks for playing!"
  end
end 
  #  , overall_game_tracker)
#if game_time(overall_game_tracker) == 1

#end