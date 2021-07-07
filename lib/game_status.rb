# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [2,4,6] # Diagonal 2
  #["X","X","X"],

]

def won?(board)
  WIN_COMBINATIONS.detect do |combos|
    board[combos[0]] ==   board[combos[1]] &&
    board[combos[1]] ==   board[combos[2]] &&
    position_taken?(board, combos[0])
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
 full?(board) && !won?(board)

end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  result = nil
  if won?(board)
    result = won?(board)
    result = board[result[0]]

  end
  result

end
