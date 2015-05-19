require './board'
require './human'
require './computer'
require './tictactoe'
require 'pry'
class TicTacToe

  attr_writer :board

  def initialize(player1, player2)
    @board = Board.new
    # @play = play
    @player1 = player1
    @player2 = player2

  end

  def play
    until @board.win? || @board.tie?
      # @board.display
      move = @player1.pick(@player1.designation)
      until @board.available?(move,@player1.designation)
        move =@player1.pick(@player1.designation)
      end

 #     @board.place_letter(move, @player1.designation) 
      # @board.display
      move2 = @player2.pick(@player2.designation)
      until @board.available?(move,@player2.designation)
        move2 =@player2.pick(@player2.designation)
        binding pry
      end
#      @board.place_letter(move, @player2.designation)
      # @board.display
    end
  end
end
