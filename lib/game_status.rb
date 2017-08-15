# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal win
  [6,4,2] # Right diagonal win
]

# Do the each way later
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if position_taken?(board, win_combo[0])
      board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]]
    end
  end
end

# Work on understanding this at a deeper level
def full?(board)
  board.all? { |token| token == "X" || token == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

# Learn other methods like first
def winner(board)
  win = won?(board)
  if win
    return board[win.first]
  end
end
