# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # top row
  [0,1,2],
  # middle row
  [3,4,5],
  # bottom row
  [6,7,8],
  # left column
  [0,3,6],
  # middle columm
  [1,4,7],
  # right column
  [2,5,8],
  # diagonal left top to right bottom
  [0,4,8],
  # diagonal right top to left bottom
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    # get the winning position index from each win_combo, see if positions are filled & if position values match
    if position_taken?(board, win_combo[0]) && board[ win_combo[0] ] == board[ win_combo[1] ] && board[ win_combo[1] ] == board[ win_combo[2] ]
      return win_combo
    else
      false
    end
  end
end

def full?(board)
  # returns true if all board positions have a value
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true # returns true if the board has not been won & the board is full
  else
    false # returns false if board is not full & board is not won / returns false if board is won
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) # if the board is won
    board[won?(board)[0]] # return the symbol that is at the first (and each) position of the win_combo [#,#,#]
    # puts board[won?(board)[0]]
  end
end
