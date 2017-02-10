# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)

top_row_win = WIN_COMBINATIONS[0]
middle_row_win = WIN_COMBINATIONS[1]
bottom_row_win = WIN_COMBINATIONS[2]
left_column_win = WIN_COMBINATIONS[3]
middle_column_win = WIN_COMBINATIONS[4]
right_column_win = WIN_COMBINATIONS[5]
diagonal_win_1 = WIN_COMBINATIONS[6]
diagonal_win_2 = WIN_COMBINATIONS[7]

  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
    top_row_win
  elsif board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
    top_row_win
  elsif board[middle_row_win[0]] == "X" && board[middle_row_win[1]] == "X" && board[middle_row_win[2]] == "X"
    middle_row_win
  elsif board[middle_row_win[0]] == "O" && board[middle_row_win[1]] == "O" && board[middle_row_win[2]] == "O"
    middle_row_win  
  elsif board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "X"
    bottom_row_win
  elsif board[bottom_row_win[0]] == "O" && board[bottom_row_win[1]] == "O" && board[bottom_row_win[2]] == "O"
    bottom_row_win
  elsif board[left_column_win[0]] == "X" && board[left_column_win[1]] == "X" && board[left_column_win[2]] == "X"
    left_column_win
  elsif board[left_column_win[0]] == "O" && board[left_column_win[1]] == "O" && board[left_column_win[2]] == "O"
    left_column_win
  elsif board[middle_column_win[0]] == "X" && board[middle_column_win[1]] == "X" && board[middle_column_win[2]] == "X"
    middle_column_win
  elsif board[middle_column_win[0]] == "O" && board[middle_column_win[1]] == "O" && board[middle_column_win[2]] == "O"
    middle_column_win	
  elsif board[right_column_win[0]] == "X" && board[right_column_win[1]] == "X" && board[right_column_win[2]] == "X"
    right_column_win
  elsif board[right_column_win[0]] == "O" && board[right_column_win[1]] == "O" && board[right_column_win[2]] == "O"
    right_column_win
  elsif board[diagonal_win_1[0]] == "X" && board[diagonal_win_1[1]] == "X" && board[diagonal_win_1[2]] == "X"
    diagonal_win_1
  elsif board[diagonal_win_2[0]] == "O" && board[diagonal_win_2[1]] == "O" && board[diagonal_win_2[2]] == "O"
    diagonal_win_2
  else 
    false
  end
end

def full?(board)
board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  if full?(board) &&  won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) 
    who_won = won?(board)
    return board[who_won[0]]
  end
end