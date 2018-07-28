#
# board = [" ", " ", " ",
#          " ", " ", " ",
#          " ", " ", " "]

########## Helper Method ##########
def position_taken?(board, index)
!(board[index].nil? || board[index] == " ")
end


########## WIN_COMBINATIONS constant ##########
WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8],  # Bottom row
[0,3,6],  # Left column
[1,4,7],  # Middle column
[2,5,8],  # Right column
[0,4,8],  # Top Left diagonal
[2,4,6]  # Top Right diagonal
]


########## WON? METHOD - Check if a winning combo exists ##########
def won?(board)
  win = ""
  #get winning combos
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    #get board values
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    #IS THERE A WIINER?
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    else
      win = false
    end
  end
  if win == false
    return win
  end
end


########## FULL? METHOD - Is the board full? ##########
def full?(board)
full = ""
board.each do |board_space|
  if board_space == " "
    return false
  else
    full = true
  end
end
if full == true
  return true
end
end


########## DRAW? METHOD - Is it a draw? ##########
def draw?(board)
if won?(board) == false && full?(board)  == true
  return true
else
  return false
end
end


########## OVER? METHOD - Is the game over? ##########
def over?(board)
if draw?(board) == true
  return true
elsif won?(board) != false
  return true
elsif draw?(board) == true
  return true
else
return false
end
end

########## WINNER? METHOD - Name the winner ##########
def winner(board)
  if won?(board) == false
    return nil
  end 
    #get winning combos
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      #get board values
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      #WHO IS THE WIINER?
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
  end
