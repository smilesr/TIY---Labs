class Player
  def initialize (species, letter) 
    @species = species
    @letter = letter
    @selection = selection
  end

  def selection
  end

  def choice
    puts "Player #{letter}.  It is your turn. Look at the board above and make your selection by typing the number of any open space:"
    @selection = gets.chomp.to_i
    while !valid_choice
      puts "Oops.  The space is not available.  Please select an open space from the board:"
      selection = gets.chomp.to_i
    end
  end

  def random_choice
    selection = rand (1..9)
    valid_choice
  end

  def valid_choice
    selection == available
    selection == number
  end

  def play
    if species == 'human'
    elsif species == 'computer'

end

class 