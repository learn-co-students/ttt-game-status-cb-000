# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
 [0,1,2], #Top row
 [3,4,5],# middle row
 [6,7,8], # bottom row
 [0,3,6], #a-horizontal
 [1,4,7], #b-horizontal
 [2,5,8], #c-horizontal
 [0,4,8], #a-across
 [2,4,6], #b-across
]

def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
  board[win_combination[0]] == board[win_combination[1]] &&
  board[win_combination[1]] == board[win_combination[2]] &&
  position_taken?(board, win_combination[0])
end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end
