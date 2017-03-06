
# testing help
# board = [" "," ", " "," "," "," "," "," "," "]
board = ["X","X", "X"," "," "," "," "," "," "]
board = ["X","X", "X","X","X","X","X","X","X"]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Won - return the board positions if someone has won
def won?(board)
  # cycle through WIN_COMBINATIONS
  WIN_COMBINATIONS.detect { |winning_combo|
    # print win_index
    # print '\n'
    position_taken?(board,winning_combo[0]) &&
      position_taken?(board,winning_combo[1]) &&
      position_taken?(board,winning_combo[2]) &&
      board[winning_combo[0]] == board[winning_combo[1]] &&
      board[winning_combo[1]] == board[winning_combo[2]]
  }
end

# Full? Return true if board is full
def full?(board)
  board.find { |square| square.nil? || square == " " } ? false : true
end

# Draw? Return true if board is full and is a draw
#       Return false is board not full or there is a winner
def draw?(board)
  full?(board) && !won?(board)
end

# Over? Return if the board has been won, is a draw, or is full.
def over?(board)
  full?(board) || won?(board) || draw?(board)
end

# Winner accept a board and return the token, "X" or "O" that has won the game given a winning board.
def winner(board)
  # Return the square entry from the winning configuration
  won?(board) ? board[won?(board)[0]] : nil
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Diagonal 1
  [2,4,6]  # Diagonal 2
  # ETC, an array for each win combination
]
