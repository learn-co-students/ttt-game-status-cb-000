# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row horz
  [3,4,5], #mid row horz
  [6,7,8], #bot row horz
  [0,3,6], #left row vert
  [1,4,7], #mid row vert
  [2,5,8], #right row vert
  [0,4,8], #tl->br diag
  [6,4,2] #bl->tr diag
]
#return false/nil if no win combination present, or return win combination as array
def won?(board)
  #return first combo that result in win
  WIN_COMBINATIONS.detect do |combo|
    #so we are testing that the value at 3 board locs are the same and we test one position to make sure its not empty
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    #have to test this for non-nil value or above would be true for all empty/nil values
    position_taken?(board,combo[0])
  end
end

#returns true if board is full else false
def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
  #there solution you don't need to use ternary operator and just do the evaluation itself since it would return the correct values
  (full?(board) && !won?(board))? true:false
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  #won? return winning combo numbers
  if combo = won?(board)
    #now we have to get the symbol
    board[combo[0]]
  end
end
