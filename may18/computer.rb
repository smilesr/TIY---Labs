class Computer

  include Enumerable
  
  def initialize
  end

  def pick(selection, board)
    selection = board.select { |x| x.is_a? Fixnum }
    selection.sample - 1
  end
end