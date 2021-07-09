# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X"
    won_array = [0, 1, 2]
  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    won_array = [0, 1, 2]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    won_array = [1, 4, 7]
  elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
    won_array = [1, 4, 7]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    won_array = [2, 5, 8]
  elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
    won_array = [2, 5, 8]
  elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    won_array = [3, 4, 5]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    won_array = [3, 4, 5]
  elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    won_array = [6, 7, 8]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    won_array = [6, 7, 8]
  elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
    won_array = [0, 4, 8]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    won_array = [0, 4, 8]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    won_array = [0, 3, 6]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
    won_array = [0, 3, 6]
  elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
    won_array = [2, 4, 6]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    won_array = [2, 4, 6]
  end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_array = won?(board)
    board[winning_array.first]
  end
end
