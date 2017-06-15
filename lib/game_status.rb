# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |winindex|
    if board[winindex[0]] == "X" && board[winindex[1]] == "X" && board[winindex[2]] == "X"
      return winindex
    elsif board[winindex[0]] == "O" && board[winindex[1]] == "O" && board[winindex[2]] == "O"
      return winindex
    end
  end
  return false
 end

def full?(board)
   board.none? { |e| e == " " }
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  end
end

def winner(board)
  winindex = won?(board)
  if winindex == false
    return nil
  elsif board[winindex[0]] == "X"
    return "X"
  elsif board[winindex[0]] == "O"
    return "O"
  end
end
