require 'pry'

class Human

  attr_accessor :board, :name, :designation

  def initialize (name, designation)
    @name = name 
    @designation = designation
 #   @board = board
  end

  def pick(designation)
    # display(board)
#    board.display
    puts "Please pick a numbered square: "
    selection = gets.chomp.to_i

    until board.available? (selection)
        puts "Space is taken. Please pick another numbered square: "
        selection = gets.chomp.to_i
    end
  end
end