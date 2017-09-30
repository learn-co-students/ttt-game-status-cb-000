# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

def won?(board)
  i = 0
  check = []
  while i < 8
  WIN_COMBINATIONS[i].each do |num|
    check << board[num]
  end
   if check.all?{|x| x == "X"} == true || check.all?{|x| x == "O"} == true
    return WIN_COMBINATIONS[i]
   end
    i += 1
    check = [ ]
  end
end


def full?(board)
    if board.any?{|i| i == " "} == true || board.any?{|i| i == ""} == true
      return false
    else
      return true
    end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != nil
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != nil
    return board[won?(board)[0]]
  end
end
