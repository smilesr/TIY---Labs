require 'pry'

def game_board()
	x = "o"
	puts "#{x}|#{x}|#{x} "
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
end

def human_turn (all_selections)
	puts "your turn"
	puts "make selection"
	selection = gets.chomp.to_i
	until valid_selection(all_selections, selection)
		puts "that space is either already taken or outside the range of the board"
		puts "make another selection:"
		selection = gets.chomp.to_i
	end
	selection
end

def valid_selection (all_selections, selection)
	number_range = (1..9).include?(selection)
	already_selected = !all_selections.include?(selection)
	number_range && already_selected
end

def computer_turn
	puts "computer's turn"
	selection = rand(1..9)
	puts selection
end


def update_board (selection, board_array)
	if selection.between?(1,3) 
		board_array[0][selection-1] = "X" 
	elsif selection.between?(4,6)
		board_array[1][selection-4] = "X"
	elsif selection.between?(7,9)
		board_array[2][selection-7] = "X"
	end
end

def display_board (board_array)	
	print board_array[0][0..2]
	puts
	print board_array[1][0..2]
	puts
	print board_array[2][0..2]
	puts
end

def did_somebody_win(board_array)
end

def play_hangman
	board_array =[[0,0,0],[0,0,0],[0,0,0]]
	all_selections = Set.new
	x=1
	until x == 10	
		selection = human_turn(all_selections)
		#puts "passed point 1"
		update_board(selection, board_array)
		display_board(board_array)
		x +=1
	end
end

play_hangman
