require './ttt-player.rb'
require './ttt-board.rb'

class Game
  def initialize
    @turns = turns = 0
    @player_types = player_types = 0
  end

def play
  pick_player_types
  if player_types == 1
    while true
      @turns += 1
      player.human(turns)
    end
  elsif player_types ==2
    while true
      @turns += 1
      if turns.odd?
        player.human(turns)
      elsif turns.even?
        player.computer
      end
    end
  elsif player_types == 3
    while true
      player.computer
    end
end

def pick_player_types
  puts "You are playing tic-tac-toe."
  puts "You have three options: (1) you can play versus another human, (2) you can play against the computer, or"
  puts "(3) you can see the outcome of the computer playing against itself"
  puts
  puts "Enter (1), (2) or (3) to make your selection:"
  @player_types = gets.chomp.to_i
  until @player_types == (1..3)
    puts "I'm sorry.  Your entry must be tbe number 1, 2 or 3.  Please select again."
    @player_types == gets.chomp.to_i
  end
end

#   def play_next_turn(player_types)
#     if player_types == 1
#       player.choice (player_types)
# #      board.status
#     elsif player_types == 2
#       turns += 1
#       if turns.odd?
#         player.choice(player_types)
#  #       board.status
#       elsif turn.even?
#         player.auto_choice (player_types)
#       end
#     elsif player_types == 3
#       player.auto_choice
#  #     board.status
#     end
#   end


end