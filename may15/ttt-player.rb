class Player
  def initialize (species, letter) 
    @letter = letter
    @selection = selection
  end

  # def selection

  # end
  # def player_setup (game_type)
  #   if game_type ==


  def human (turns)
    board.display
    if turns.odd? letter = 'X' else letter = 'O' end
    puts "Player #{letter}.  It is your turn. Look at the board above and make your selection by typing the number of any open space:"
    @selection = gets.chomp.to_i
    while !valid_choice
      puts "Oops.  The space is not available.  Please select an open space from the board:"
      @selection = gets.chomp.to_i
    end
    board.status (selection, letter)
  end

  def computer
    @selection = rand (1..9)
    while !valid_choice
      @selection = gets.chomp.to_i  
    end
    board.status
  end

  def valid_choice (board)
    @selection == board.available
    @selection.between? (1, 9)
  end

  def play
    if species == 'human'
      choice
    elsif species == 'computer'
      auto_choice
    end
   end 
end
