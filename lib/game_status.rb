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
  WIN_COMBINATIONS.find do |win_index|
    (board[win_index[0]] == "X" && board[win_index[1]] == "X" && board[win_index[2]] == "X") || (board[win_index[0]] == "O" && board[win_index[1]] == "O" && board[win_index[2]] == "O")
  end
end

def full?(board)
  !board.find { |position| (position == " " || position.nil?) }
end

def draw?(board)
  return false if won?(board)
  if full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  return true if won?(board) || full?(board)
end

def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  end
end
