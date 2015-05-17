require 'pry'
require 'set'

class Board

  WINNING_COMBOS = [[1,2,3], [1,5,9], [1,4,7], [2,5,8], [3,5,7], [3,6,9], [4,5,6], [7,8,9]]
  ORIGINAL_BOARD = [1,2,3,4,5,6,7,8,9]
  def initialize
    @board = board
      @board = (1..9).to_a
  end


  def board_status(selection, letter)
    until win? || scratch?
      @board[selection] = letter
      binding.pry
      board_display
      @board.each {|x| x.to_i}
    end
    tic.tac.toe-3    
  end

  def board_display
    puts" #{board[0]}     |     #{board[1]}     |     #{board[2]}
             ---------          -----------           -----------
          #{board[3]}     |     #{board[4]}     |     #{board[5]}
            ----------          -----------           -----------
          #{board[6]}     |     #{board[7]}     |     #{board[8]}"
  end

  def win?
    x = @board.to_set
    y = WINNING_COMBOS.to_set
    y.subset?(x)
  end

  def scratch?
    @board == nil
  end

  def available
    @board = @board.find_all {|y| y>0}
  end







end 