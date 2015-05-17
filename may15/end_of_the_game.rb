require './ttt-player.rb'
require './ttt-board.rb'
require './end_of_the_game.rb'

class TheEnd

  def initialize

  puts "GAME OVER!"
  puts ""
  puts "Would you like to play again? Type 'yes' or 'no':"
  x = gets.chomp.downcase
  until x == "yes" || x == "no"
    puts "Please type either 'yes' or 'no':"
    x = gets.chomp.downcase
  end

  if x == "yes"
    Game.new
  else
    puts "Thanks for playing!"
  end

  end

end
