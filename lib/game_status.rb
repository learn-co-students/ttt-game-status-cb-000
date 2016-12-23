def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # last row
  [0,3,6], #first column
  [1,4,7], # second column
  [2,5,8], #third column
  [0,4,8], #left diagonal
  [2,4,6], #right diagonal
]

def won?(board)

  WIN_COMBINATIONS.each do |win_array|
    if board[win_array[0]] == "X" && board[win_array[1]] == "X" && board[win_array[2]] == "X"
      return win_array
    elsif board[win_array[0]] == "O" && board[win_array[1]] == "O" && board[win_array[2]] == "O"
      return win_array
    end
  end
  false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  winning_board = won?(board)
  if won?(board) != false
    return board[winning_board[0]]
  end
end
