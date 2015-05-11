# this version only contains code for NORMAL version 

require 'set'
# this function asks human player for selection
def human_turn (selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
  if turn_tracker.odd?; x="X" else x="O" end
  clear_screen
	puts "It is your turn Player #{x}"
  puts
  display_board(board_array)
	puts
  puts "Review the above table and then select your space by typing 1-9:"
	selection = gets.chomp.to_i
	until valid_selection(selections_of_player_X, selections_of_player_O, selection)
		puts "That selection is either already taken or outside the range of the board."
		puts "Please make a new selection:"
		selection = gets.chomp.to_i
	end
	selection
end
# this function tracks all of player x's selections
def keep_track_of_selections_of_player_X (selection,selections_of_player_X)
  selections_of_player_X.add(selection)
end
# this function tracks all of player o's selections
def keep_track_of_selections_of_player_O (selection,selections_of_player_O)
  selections_of_player_O.add(selection)
end
# this function checks the input of human and computer to make sure it isn't out of range or a duplicate
def valid_selection (selections_of_player_X, selections_of_player_O, selection)
	number_range = (1..9).include?(selection)
	already_selected = !selections_of_player_X.include?(selection) && !selections_of_player_O.include?(selection) 
	number_range && already_selected
end
# this function makes a selection for the computer player
def computer_turn (selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
  selection = rand(1..9)
  clear_screen
  until valid_selection(selections_of_player_X, selections_of_player_O, selection)
    selection = rand(1..9)
  end
  selection
end
# this function keeps track of the selections in relation to the other player's
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
end
# this shows the game board
def display_board (board_array)	
  x=0
  x1=Array.new
  x2=Array.new ["-","+","-","+","-"]
  x3=Array.new
  x4=Array.new ["-","+","-","+","-"]
  x5=Array.new
	for x in 0..4
    if x.odd? then x1[x]="|"
      else x1[x] = board_array[0][x/2]
    end
  end
  for x in 0..4
    if x.odd? then x3[x]="|"
      else x3[x] = board_array[1][x/2]
    end
  end
  for x in 0..4 
    if x.odd? then x5[x]="|"
      else x5[x] = board_array[2][x/2]
    end
  end

  print "#{x1[0]}#{x1[1]}#{x1[2]}#{x1[3]}#{x1[4]}"
  puts
  print  "#{x2[0]}#{x2[1]}#{x2[2]}#{x2[3]}#{x2[4]}" 
  puts
  print  "#{x3[0]}#{x3[1]}#{x3[2]}#{x3[3]}#{x3[4]}"
  puts
  print  "#{x4[0]}#{x4[1]}#{x4[2]}#{x4[3]}#{x4[4]}"
  puts
  print  "#{x5[0]}#{x5[1]}#{x5[2]}#{x5[3]}#{x5[4]}"
end
# this function checks to see if a player has won
def did_somebody_win(selections_of_player_X, selections_of_player_O, turn_tracker) 
  puts
  win1 = Set.new [1,2,3]
  win2 = Set.new [1,5,9]
  win3 = Set.new [1,4,7]
  win4 = Set.new [2,5,8]
  win5 = Set.new [3,5,7]
  win6 = Set.new [3,6,9]
  win7 = Set.new [4,5,6]
  win8 = Set.new [7,8,9]
  if (win1.subset?(selections_of_player_X.to_set) || win2.subset?(selections_of_player_X.to_set) || win3.subset?(selections_of_player_X.to_set) ||
      win4.subset?(selections_of_player_X.to_set) || win5.subset?(selections_of_player_X.to_set) || win6.subset?(selections_of_player_X.to_set) ||
      win7.subset?(selections_of_player_X.to_set) || win8.subset?(selections_of_player_X.to_set))
      winner = "X"
 elsif 
     (win1.subset?(selections_of_player_O.to_set) || win2.subset?(selections_of_player_O.to_set) || win3.subset?(selections_of_player_O.to_set) ||
      win4.subset?(selections_of_player_O.to_set) || win5.subset?(selections_of_player_O.to_set) || win6.subset?(selections_of_player_O.to_set) ||
      win7.subset?(selections_of_player_O.to_set) || win8.subset?(selections_of_player_O.to_set))
      winner = "O"
  else
      winner = "nobody"
  end 
  return winner  
end
# this function creates some space on the display to make screen easier to read
def clear_screen
  counter=0 
  until counter == 5 
    puts " "
    counter += 1
  end
end

def play_hangman (mode)
	board_array =[[1,2,3],[4,5,6],[7,8,9]]
  selections_of_player_X = Set.new
  selections_of_player_O = Set.new
  turn_tracker = 0
  winner = "nobody"
  until winner != "nobody" || turn_tracker == 9
    if mode ==1
      turn_tracker +=1
      selection = human_turn(selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
    elsif mode ==2
      turn_tracker += 1
      if turn_tracker.odd? 
        selection = human_turn(selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
      else
        selection = computer_turn(selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
        puts "The computer has taken space #{selection}."
      end
    elsif mode ==3
      turn_tracker +=1
      selection = computer_turn(selections_of_player_X, selections_of_player_O, turn_tracker, board_array)
      if turn_tracker.odd? then puts "Computer Player X has selected #{selection}." end
      sleep 4
      if turn_tracker.even? then puts "Computer Player Y has selected #{selection}." end
    else
      puts "you didn't select a proper mode"
    end
    if turn_tracker.odd?
      selections_of_player_X = keep_track_of_selections_of_player_X(selection,selections_of_player_X)

    else
      selections_of_player_O = keep_track_of_selections_of_player_O(selection,selections_of_player_O)

    end
		update_board(selection, board_array, turn_tracker)
		display_board(board_array)
    winner = did_somebody_win(selections_of_player_X, selections_of_player_O, turn_tracker).to_s
	end

clear_screen
if turn_tracker == 9 then puts "SCRATCH GAME." end
if winner != "nobody" then puts "CONGRATULATIONS PLAYER #{winner}. YOU ARE THE WINNER." end
end



#************************START OF THE PROGRAM**************************
clear_screen
puts "WELCOME TO HANGMAN"
puts
puts "Which mode would you like to play in:"
puts
puts "1 - you vs. another human"
puts "2 - you vs. the computer"
puts "3 - computer vs. computer"  
puts
puts "Please enter a number 1-3 to indicate the mode:"
mode = gets.chomp.to_i
play_hangman (mode)
