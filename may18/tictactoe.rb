require './board'
require './human'
require './computer'
require './tictactoe'

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
      move = @player1.pick(@board, @player1.designation)
      @board.place_letter(move, @player1.designation) 
      move2 = @player2.pick(@board, @player2.designation)
      @board.place_letter(move, @player2.designation)
    end
  end
end
