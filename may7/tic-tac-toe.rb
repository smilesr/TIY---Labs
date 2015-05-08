require 'pry'

def game_board()
	x = "o"
	puts "#{x}|#{x}|#{x} "
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
end

def human_move_selection()
	puts "Make your selection by typing in the number of the space that you want your 'x' to appear"
	selection = gets.chomp
end


def move_tracking(board_array, human_move_selection)
	selection = human_move_selection
	if selection (1 .. 3)
		board_array[0][selection-1] = selection unless board_array[0][selection-1] != 0
	elsif selection (4 .. 6)
		board_array[1][selection-4] = selection unless board_array[0][selection-1] != 0
	elsif selection (7 .. 9)
		board_array[2][selection-7] = selection unless board_array[0][selection-1] != 0
	else
		puts "pick again"
	end
	puts board_array
end

def mode()
	puts "Which mode do you want to play: (1) you vs computer, (2) you vs another human, or (3) computer vs computer - enter a number"
	mode = gets.chomp.to_i
end


#def human_vs_computer()
#	puts "Make your selection by typing in the number of the space that you want your 'x' to appear"
#	selection = gets.chomp
#end

def computer_move_generator()
	selection = rand(1..9)
end


def tic_tac_toe()
	turns = 10
	board_array =[[0,0,0],[0,0,0],[0,0,0]]
	until turns ==0
		mode()	
		human_move_selection
		puts human_move_selection
		move_tracking(board_array, human_move_selection)
#human_vs_computer()
#board_array_function(board_array,selection)
		game_board()
		turns -= 1
	end
end

tic_tac_toe()