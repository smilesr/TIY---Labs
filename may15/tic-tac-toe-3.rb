require './ttt-player'
require './ttt-board'
require './end_of_the_game'

require 'pry'
include Comparable

class Game
attr_accessor :player
attr_accessor :turns

  def initialize
    @turns = turns = 0
    @player_types = player_types = 0
 #   @game = game
  end

def play
  pick_player_types
  if @player_types == 1
    while true
      @turns += 1
        human(@turns)
    end
  elsif @player_types ==2
    while true
      @turns += 1
      if @turns.odd?
        human(@turns)
      elsif @turns.even?
        computer
      end
    end
  elsif @player_types == 3
    while true
      computer
    end
  end
end

def pick_player_types
  puts "You are playing tic-tac-toe."
  puts "You have three options: (1) you can play versus another human, (2) you can play against the computer, or"
  puts "(3) you can see the outcome of the computer playing against itself"
  puts
  puts "Enter (1), (2) or (3) to make your selection:"
  @player_types = gets.chomp.to_i
  until @player_types.between?(1,3)
    puts "I'm sorry.  Your entry must be tbe number 1, 2 or 3.  Please select again."
    @player_types == gets.chomp.to_i
  end
end
end

# x = Game.new
# y = Player.new
# z = Board.new
# zz = TheEnd.new
# x.play