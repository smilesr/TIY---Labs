require 'pry'
require 'set'

def human_turn (selections_of_player_X, selections_of_player_O, turn_tracker)
  if turn_tracker.odd?; x="X" else x="O" end
	puts "your turn player #{x}"
	puts "select your space by typing 1-9"
	selection = gets.chomp.to_i
	until valid_selection(selections_of_player_X, selections_of_player_O, selection)
		puts "that space is either already taken or outside the range of the board"
		puts "make another selection:"
		selection = gets.chomp.to_i
	end
	#all_selections.add(selection)
	selection
end

def keep_track_of_selections_of_player_X (selection,selections_of_player_X)
  selections_of_player_X.add(selection)
end
def keep_track_of_selections_of_player_O (selection,selections_of_player_O)
  selections_of_player_O.add(selection)
end

def valid_selection (selections_of_player_X, selections_of_player_O, selection)
	number_range = (1..9).include?(selection)
	already_selected = !selections_of_player_X.include?(selection) || !selections_of_player_O.include?(selection) 
	number_range && already_selected
end

def computer_turn
	puts "computer's turn"
	selection = rand(1..9)
	puts selection
end


def update_board (selection, board_array, turn_tracker)
  puts selection
  if turn_tracker.odd?
	 if selection.between?(1,3) 
	   	board_array[0][selection-1] = "X" 
	 elsif selection.between?(4,6)
	   	board_array[1][selection-4] = "X"
	 elsif selection.between?(7,9)
	   	board_array[2][selection-7] = "X"
	 end
  else
    if selection.between?(1,3) 
      board_array[0][selection-1] = "0" 
   elsif selection.between?(4,6)
      board_array[1][selection-4] = "0"
   elsif selection.between?(7,9)
      board_array[2][selection-7] = "0"
    end
  end
  #print board_array[0][0..2]
  #puts
  #print board_array[1][0..2]
  #puts
  #print board_array[2][0..2]
  #puts
end

def display_board (board_array)	
	print board_array[0][0..2]
	puts#
	print board_array[1][0..2]
	puts
	print board_array[2][0..2]
	puts
	#x = "-"
	#puts "#{x}|#{x}|#{x} "
	#puts "-+-+-"
	#puts "#{x}|#{x}|#{x}"
	#puts "-+-+-"
	#suts "#{x}|#{x}|#{x}"
end

def did_somebody_win(selections_of_player_X, selections_of_player_O, turn_tracker) 
  #puts "TEST: at somebody win #{all_selections.to_a}"
  #choices = all_selections.to_set
  puts "this is selections of x: #{selections_of_player_X.to_a}"
  puts "this is selections of o: #{selections_of_player_O.to_a}"
  puts turn_tracker
  win1 = Set.new [1,2,3]
  win2 = Set.new [1,5,9]
  win3 = Set.new [1,4,7]
  win4 = Set.new [2,5,8]
  win5 = Set.new [3,5,7]
  win6 = Set.new [3,6,9]
  win7 = Set.new [4,5,6]
  win8 = Set.new [7,8,9]
  if (win1.subset?(selections_of_player_X.to_set) ||  win2.subset?(selections_of_player_X.to_set) ||  win3.subset?(selections_of_player_X.to_set) ||
      win4.subset?(selections_of_player_X.to_set) || win5.subset?(selections_of_player_X.to_set) || win6.subset?(selections_of_player_X.to_set) ||
      win7.subset?(selections_of_player_X.to_set) || win8.subset?(selections_of_player_X.to_set))
      puts "you win"
  end 
  if (win1.subset?(selections_of_player_O.to_set) ||  win2.subset?(selections_of_player_O.to_set) ||  win3.subset?(selections_of_player_O.to_set) ||
      win4.subset?(selections_of_player_O.to_set) || win5.subset?(selections_of_player_O.to_set) || win6.subset?(selections_of_player_O.to_set) ||
      win7.subset?(selections_of_player_O.to_set) || win8.subset?(selections_of_player_O.to_set))
      puts "you win"
  end   
end
  #winning_combinations = Array.new [[win1],[[win2]],[[win3]], [[win4]],[[win5]],[[win6]],[[win7]],[[win8]]]
  #winning_combinations.each do |x|
   # if winning_combinations[x].to_set.subset?(all_selections)
   #   puts "you win"
   #   break
   # end
  #end

def play_hangman (mode)
	board_array =[[0,0,0],[0,0,0],[0,0,0]]
	#all_selections = Set.new
  selections_of_player_X = Set.new
  selections_of_player_O = Set.new
  turn_tracker = 0
  x=0
  display_board(board_array)
  until x==10
    if mode ==1
      turn_tracker +=1
      selection = human_turn(selections_of_player_X, selections_of_player_O, turn_tracker)
    elsif mode ==2
      turn_tracker += 1
      if turn_tracker.even? 
        selection = human_turn(selections_of_player_X, selections_of_player_O)
      else
        selection = computer_turn(selections_of_player_X, selections_of_player_O)
      end
    elsif mode ==3
      turn_tracker +=1
      selection = computer_turn(selections_of_player_X, selections_of_player_O)
    else
      puts "you didn't select a proper mode"
    end
		#puts "passed point 1"
    if turn_tracker.odd?
      selections_of_player_X = keep_track_of_selections_of_player_X(selection,selections_of_player_X)
      puts "the odd branch in the play hangman function"
    else
      selections_of_player_O = keep_track_of_selections_of_player_O(selection,selections_of_player_O)
      puts "the even branch in the play hangman function"
    end
		update_board(selection, board_array, turn_tracker)
		display_board(board_array)
    did_somebody_win(selections_of_player_X, selections_of_player_O, turn_tracker)
    x +=1
	end
end

puts "which mode are you playing: (1) you vs. computer, (2) you vs. another human, or (3) computer vs. computer: enter a number"
mode = gets.chomp.to_i
play_hangman (mode)
