require 'pry'

class Board

  WINNING_COMBOS = ()

  def initialize
    @board = board
      @board = (1..9).to_a
  end


  def board_status(selection, letter)
    @board[selection] = letter  
  end

  def board_display
    puts" #{board[0]}     |     #{board[1]}     |     #{board[2]}
             ---------          -----------           -----------
          #{board[3]}     |     #{board[4]}     |     #{board[5]}
            ----------          -----------           -----------
          #{board[6]}     |     #{board[7]}     |     #{board[8]}"
  end
  def win?
  end

  def available
    @board.each {|x| x.to_i}
    @board = @board.find_all {|y| y>0}
  end





end 