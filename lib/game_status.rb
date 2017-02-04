# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  #top row
  [3, 4, 5],  #middle row
  [6, 7, 8],  #bottom row
  [0, 3, 6],  #first vertical row
  [1, 4, 7],  #second vertical row
  [2, 5, 8],  #third vertical row
  [0, 4, 8],  #diagonal 1
  [2, 4, 6]   #diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X" || board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
