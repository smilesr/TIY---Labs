require 'pry'

class Board

  include Enumerable 

  WINS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]]

  attr_accessor :board 

  def initialize
    @board = (1..9).to_a
  end

  # def display(board) 
  #   puts" #{board[0]}     |     #{board[1]}     |     #{board[2]}
  #            ---------          -----------           -----------
  #         #{board[3]}     |     #{board[4]}     |     #{board[5]}
  #           ----------          -----------           -----------
  #         #{board[6]}     |     #{board[7]}     |     #{board[8]}"
  # end

  def display
      puts" #{@board[0]}     |     #{@board[1]}     |     #{@board[2]}
     ---------          -----------           -----------
           #{@board[3]}     |     #{@board[4]}     |     #{@board[5]}
     ----------          -----------           -----------
           #{@board[6]}     |     #{@board[7]}     |     #{@board[8]}"
  end

  def win?
    WINS.any? do |x, y, z|
      @board[x] == @board[y] && @board[y] == @board[z]
    end
  end

  def tie?
    @board.all? { |x| x.is_a? String }
  end

  def available?(selection)
      @board.select { |x| x.is_a? Fixnum }.include?(selection)
      # binding.pry
  end

  def place_letter (selection, designation)
      # if designation == 'x'
      #   @board[move - 1] = 'x'
      # elsif designation == 'o'
      #   @board[move - 1] = 'o'
      # end
#binding.pry
      @board[selection.to_i - 1] = designation
      @board.display
#      puts @board

  end    

end