require 'pry'
require 'set'

def human_turn (all_selections)
	puts "your turn!"
	puts "make selection"
	selection = gets.chomp.to_i
	until valid_selection(all_selections, selection)
		puts "that space is either already taken or outside the range of the board"
		puts "make another selection:"
		selection = gets.chomp.to_i
	end
	all_selections.add(selection)
	puts "at the end of human turn #{all_selections.to_a}"
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
  if turn_tracker.even?
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

def display_board (board_array)	
	print board_array[0][0..2]
	puts
	print board_array[1][0..2]
	puts
	print board_array[2][0..2]
	puts
	x = "o"
	puts "#{x}|#{x}|#{x} "
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
	puts "-+-+-"
	puts "#{x}|#{x}|#{x}"
end

def did_somebody_win(all_selections) 
  puts "at somebody win #{all_selections.to_a}"
  #choices = all_selections.to_set
  win1 = Set.new [1,2,3]
  win2 = Set.new [1,5,9]
  win3 = Set.new [1,4,7]
  win4 = Set.new [2,5,8]
  win5 = Set.new [3,5,7]
  win6 = Set.new [3,6,9]
  win7 = Set.new [4,5,6]
  win8 = Set.new [7,8,9]
  if (win1.subset?(all_selections.to_set) ||  win2.subset?(all_selections.to_set) ||  win3.subset?(all_selections.to_set) ||
      win4.subset?(all_selections.to_set) || win5.subset?(all_selections.to_set) || win6.subset?(all_selections.to_set) ||
      win7.subset?(all_selections.to_set) || win8.subset?(all_selections.to_set))
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
	all_selections = Set.new
  turn_tracker = 0
  x=0
  until x=10
    if mode ==1
      turn_tracker +=1
      selection = human_turn(all_selections)
    elsif mode ==2
      turn_tracker += 1
      if turn_tracker.even? 
        selection = human_turn(all_selections)
      else
        selection = computer_turn(all_selections)
      end
    elsif mode ==3
      turn_tracker +=1
      selection = computer_turn(all_selections)
    else
      puts "you didn't select a proper mode"
    end
		#puts "passed point 1"
		update_board(selection, board_array)
		display_board(board_array)
    did_somebody_win(all_selections)
	end
end

puts "which mode are you playing: (1) you vs. computer, (2) you vs. another human, or (3) computer vs. computer: enter a number"
mode = gets.chomp
play_hangman (mode)
