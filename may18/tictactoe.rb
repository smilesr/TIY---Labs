require './board'
require './human'
require './computer'
require './tictactoe'
require 'pry'
class TicTacToe

  attr_writer :board

  def initialize(player1, player2)#, overall_game_tracker)
    @board = Board.new
    # @play = play
    @player1 = player1
    @player2 = player2
#    @overall_game_tracker = overall_game_tracker
  end


  def play
    current_player = @player1
    @board.display
    until @board.win? || @board.tie?
      move = current_player.pick(current_player.designation)

      until @board.available?(move,current_player.designation)
        puts "That space is taken!"
        puts ""
        move =current_player.pick(current_player.designation)
      end

      @board.place_selection_on_board(move, current_player.designation)

      current_player = current_player == @player1 ? @player2 : @player1
    end

    if @board.win?
      # Due to the structure of the code, the current player advances to the next player AFTER a winner is discovered,
      # so following code corrects this anomaly for purposes of identifying the winner
      if current_player.designation == "O"
        current_player.designation = "X"
      elsif current_player.designation == "X"
        current_player.designation = "O"
      end
      puts "You win Player #{current_player.designation}!"
    else
      puts "It was a Cat's Game!"
    end
  # puts "Do you want to play again: (1) yes or (2) no"
  # @overall_game_tracker = gets.chomp.to_i
  # game_time(@overall_game_tracker)

  end
end
