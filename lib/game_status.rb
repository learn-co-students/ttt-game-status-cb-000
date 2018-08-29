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
  [6,4,2]]


def won?(board)
  WIN_COMBINATIONS.find do |comb|
    board[comb[0]] == board[comb[1]] &&
    board[comb[1]] == board[comb[2]] &&
    position_taken?(board,comb[0])

  end
end

def full?(board)
  board.all?  do |token|
    token == "X" || token== "O"
  end
end

def draw?(board)

  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
   comb = won?(board)
   board[comb[0]]
 else
   nil
 end
end
