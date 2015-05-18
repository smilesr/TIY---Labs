require 'pry'
require 'set'

class Board
  attr_accessor :board
  attr_accessor :temporary_board
  WINNING_COMBOS = [[1,2,3], [1,5,9], [1,4,7], [2,5,8], [3,5,7], [3,6,9], [4,5,6], [7,8,9]]
  ORIGINAL_BOARD = [1,2,3,4,5,6,7,8,9]
  def initialize
    @board = board
      @board = (1..9).to_a
    @temporary_board = temporary_board = ORIGINAL_BOARD
  end


  def status(selection, letter)
    until win? || scratch?
      @board[selection] = letter
      board_display
      create_temp_board
    end
    TheEnd  
  end


  def board_display
    puts" #{board[0]}     |     #{board[1]}     |     #{board[2]}
             ---------          -----------           -----------
          #{board[3]}     |     #{board[4]}     |     #{board[5]}
            ----------          -----------           -----------
          #{board[6]}     |     #{board[7]}     |     #{board[8]}"
  end

  def win?
    x = @temporary_board.to_set
    y = WINNING_COMBOS.to_set
    y.subset?(x)
  end

  def scratch?
    @temporary_board == nil
  end

  def available (selection)
    @board[selection].is_a? (Fixnum)
 #   @available_spaces = @temporary_check_board.find_all {|y| y>0}
 #  @selection.subset?(@available_spaces)
  end

  def create_temp_board
    temporary_board = @board.each {|x| x.to_i}
    [1..9].each do |x|
      if ORIGINAL_BOARD[x] == @board[x]
        temp_board[x] = 0
      elsif ORIGINAL_BOARD[x] != @board[x]
        temp_board[x] = ORIGINAL_BOARD[x]
      end
    end
  end
end
