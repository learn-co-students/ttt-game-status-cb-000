def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

# checking winning combinations vs places on the board.
# the first combination with either all X or all O will be returned
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[0]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

# checking if all board positions are either X or O
def full?(board)
  board.all? do |position|
    position == 'X' || position == 'O'
  end
end

# checking if the game is won or if the board is full
def draw?(board)
  !won?(board) && full?(board)
end

# checking if the game is won or there's a draw
def over?(board)
  draw?(board) || won?(board)
end

# 1. grabbing the winning combo, if there is one
# 2. if there is, returning the first element of the combo
# (we've already made sure all elements of it are either X's or O's)
def winner(board)
  combo = won?(board)
  if combo
    board[combo[0]]
  end
end
