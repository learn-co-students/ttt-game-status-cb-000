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

# Determines if the game is won. Takes an board array and returns a boolean
def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

# Takes a array as an argument and returns true if all positions taken else false
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

# Takes a board as an argument and returns true for a draw, else false
def draw?(board)
  !won?(board) && full?(board)
end

# Takes a board as an argument and returns true if the game is over else false
def over?(board)
  full?(board) || won?(board)
end

# Takes a board as an argument and returns the winner as X or O
def winner(board)
  if won = won?(board)
    board[won[0]]
  end
end
