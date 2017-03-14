require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First row
  [1,4,7],  # Second row
  [2,5,8],  # Third row
  [0,4,8],  # Diagonal down
  [2,4,6]  # Diagonal up
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |sign|
    sign == "X" || sign == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
   won?(board) || full?(board)
end

def winner(board)
  if winn = won?(board)
    board[winn.first]
  end
end
