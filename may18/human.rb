require 'pry'

class Human

  attr_accessor :board, :name, :designation

  def initialize (designation)

    @designation = designation
  end

  def pick(designation)
    puts "Player #{designation}, it is your turn.
    Please pick a numbered square: "
    selection = gets.chomp.to_i
  end

end