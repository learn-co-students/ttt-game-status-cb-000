# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], #diagonal
  [2,4,6] #other diagonal
]

def won?(board)
	WIN_COMBINATIONS.detect do |combo|
		board[combo[0]] == board[combo[1]] &&
		board[combo[1]] == board[combo[2]] &&
		position_taken?(board,combo[0])
	end
end

def full?(board)
  board.all? { |pos| pos == "X" || pos == "O" }
end

def draw?(board)
  #returns true if the board has not been won and is full and
  #false if the board is not won and the board is not full, and false if the board is won.
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  #returns true if the board has been won, is a draw, or is full.
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  win_pos = won?(board)
  if win_pos.kind_of?(Array)
    return board[win_pos[0]]
  else
    return nil
  end
end
