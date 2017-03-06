# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],#verticals
  [3,4,5],
  [6,7,8],
  [0,3,6],#horizontal
  [1,4,7],
  [2,5,8],
  [0,4,8], #diagonals
  [6,4,2]
]

def won? (board)
WIN_COMBINATIONS.each do |won|
if board[won[0]] == "X" && board[won[1]] == "X" && board[won[2]] == "X"
return  won
elsif board[won[0]] == "O" && board[won[1]] == "O" && board[won[2]] == "O"
return won
else
end
end
 false
end

def full? (board)
board.none?{|i| i == " " }
end

def draw? (board)
if won?(board) == false &&  full?(board) == true
  return true
elsif won?(board) == false && full?(board)== false
  return false
  elsif won?(board)
    return false
end
end

def over?(board)
  if won?(board) == true || full?(board) == true
return true
end
end

def winner(board)
  if won?(board) == false
    return nil
 elsif  board[won?(board)[0]] =="X"
  return "X"
elsif  board[won?(board)[1]]=="O"
    return "O"
end
end
