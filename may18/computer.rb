class Computer

  include Enumerable
  attr_accessor :designation

  def initialize(designation)
    @designation = designation
  end

  def pick(designation)
     puts "Player #{designation}, it is your turn.
    Please pick a numbered square: "
    selection = rand(1..9)
  end
end